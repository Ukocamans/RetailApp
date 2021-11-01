//
//  CartItemModel.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation

final class CartItemModel {
    let title: String
    var amount: Int
    let price: String
    let id: Int
    
    init(model: ProductItemModel) {
        self.title = model.title ?? ""
        self.amount = 1
        self.price = model.price ?? ""
        self.id = model.id ?? -1
    }
}
