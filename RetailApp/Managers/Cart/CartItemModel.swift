//
//  CartItemModel.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation

final class CartItemModel {
    let productModel: ProductItemModel
    var amount: Int
    
    init(model: ProductItemModel) {
        self.productModel = model
        self.amount = 1
    }
}
