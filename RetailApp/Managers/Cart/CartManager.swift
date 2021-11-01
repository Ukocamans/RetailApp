//
//  CartManager.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation

final class CartManager {
    static let shared = CartManager()
    
    init() {}
    
    var cartItems: [CartItemModel] = []
    
    func add(productModel: ProductItemModel) {
        var found = false
        cartItems.forEach { (cartItem) in
            if productModel.id == cartItem.id {
                cartItem.amount += 1
                found = true
            }
        }
        if !found  {
            let model = CartItemModel(model: productModel)
            cartItems.append(model)
        }
    }
    
    func substract(productModel: ProductItemModel) {
        cartItems.enumerated().forEach { (index, cartItem) in
            if productModel.id == cartItem.id {
                cartItem.amount -= 1
                if cartItem.amount == 0 {
                    cartItems.remove(at: index)
                }
                return
            }
        }
    }
    
    func remove(productModel: ProductItemModel) {
        cartItems.enumerated().forEach { (index, cartItem) in
            if productModel.id == cartItem.id {
                cartItems.remove(at: index)
                return
            }
        }
    }
}
