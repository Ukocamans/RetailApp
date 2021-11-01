//
//  CartContracts.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation

protocol CartViewModelProtocol {
    var delegate: CartViewModelDelegate? { get set }
    func order()
}

protocol CartViewModelDelegate: AnyObject {
    func handleViewModelOutput(output: CartViewModelOutput)
}

enum CartViewModelOutput: Equatable {
    case setLoading(Bool)
    case finished
    case error(NSError)
}
