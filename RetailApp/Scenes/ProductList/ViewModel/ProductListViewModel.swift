//
//  ProductListViewModel.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation
import Data

final class ProductListViewModel: ProductListViewModelProtocol {
    
    weak var delegate: ProductListViewModelDelegate?
    private let productServices: ProductServicesProtocol
    
    init(productServices: ProductServicesProtocol) {
        self.productServices = productServices
    }
    
    func loadData() {
        delegate?.handleViewModelOutput(output: .setLoading(true))
        productServices.listing { [weak self] (result) in
            guard let self = self else {
                return
            }
            self.delegate?.handleViewModelOutput(output: .setLoading(false))
            switch result {
            case.success(let model):
                dump(model)
                self.delegate?.handleViewModelOutput(output: .finished)
            case .failure(let error):
                dump(error)
            case .empty:
                print("empty")
            }
        }
    }
}
