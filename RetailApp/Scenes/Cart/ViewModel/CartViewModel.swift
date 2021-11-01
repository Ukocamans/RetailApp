//
//  CartViewModel.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation
import Data

final class CartViewModel: CartViewModelProtocol {
    weak var delegate: CartViewModelDelegate?
    private let cartServices: CartServicesProtocol
    
    init(cartServices: CartServicesProtocol) {
        self.cartServices = cartServices
    }
    
    private func createProductItems(model: ProductListResponseModel) -> [ProductItemModel] {
        return model.map { (productModel) -> ProductItemModel in
            var model = ProductItemModel(with: productModel)
            model.action = {
                CartManager.shared.add(productModel: model)
            }
            return model
        }
    }
    
    private func createOrderRequestModel() -> OrderRequestModel {
        CartManager.shared.cartItems.map { (model) -> OrderModel in
            return OrderModel(id: model.productModel.id ?? -1, amount: model.amount)
        }
    }
    
    func order() {
        let requestModel: OrderRequestModel = createOrderRequestModel()
        delegate?.handleViewModelOutput(output: .setLoading(true))
        cartServices.order(requestModel: requestModel) { [weak self] (result) in
            guard let self = self else {
                return
            }
            self.delegate?.handleViewModelOutput(output: .setLoading(false))
            switch result {
            case .success(let model):
                switch model.status {
                case .success:
                    self.delegate?.handleViewModelOutput(output: .finished)
                case .failed:
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: model.message ?? ""])
                    self.delegate?.handleViewModelOutput(output: .error(error))
                default:
                    print("something went wrong")
                }
            case .failure(let error):
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
                self.delegate?.handleViewModelOutput(output: .error(error))
            case .empty:
                print("empty")
            }
        }
    }
}
