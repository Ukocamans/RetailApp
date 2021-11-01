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
    
    func order() {
        let requestModel: OrderRequestModel = []
        delegate?.handleViewModelOutput(output: .setLoading(true))
        cartServices.order(requestModel: requestModel) { [weak self] (result) in
            guard let self = self else {
                return
            }
            self.delegate?.handleViewModelOutput(output: .setLoading(false))
            switch result {
            case .success(let model):
                dump(model)
            case .failure(let error):
                self.delegate?.handleViewModelOutput(output: .error(error))
                dump(error)
            case .empty:
                print("empty")
            }
        }
    }
}
