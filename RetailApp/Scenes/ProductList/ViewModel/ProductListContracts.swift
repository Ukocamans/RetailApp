//
//  ProductListContracts.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation

protocol ProductListViewModelProtocol {
    var delegate: ProductListViewModelDelegate? { get set }
    func loadData()
}

protocol ProductListViewModelDelegate: AnyObject {
    func handleViewModelOutput(output: ProductListViewModelOutput)
}

enum ProductListViewModelOutput {
    case setLoading(Bool)
    case finished
    case error(Error)
}
