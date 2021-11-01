//
//  ProductListContracts.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation
import UIKit

protocol ProductListViewModelProtocol {
    var delegate: ProductListViewModelDelegate? { get set }
    func loadData()
    func getProducts() -> [ProductItemModel]
}

protocol ProductListViewModelDelegate: AnyObject {
    func handleViewModelOutput(output: ProductListViewModelOutput)
}

enum ProductListViewModelOutput: Equatable {
    case setLoading(Bool)
    case finished
    case error(NSError)
    case askNavigationTo(UIViewController)
}
