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
            if productModel.id == cartItem.productModel.id {
                cartItem.amount += 1
                found = true
            }
        }
        if !found  {
            let model = CartItemModel(model: productModel)
            cartItems.append(model)
        }
        NotificationCenter.default.post(name: .amountChanged, object: nil, userInfo: nil)
    }
    
    func substract(productModel: ProductItemModel) {
        cartItems.enumerated().forEach { (index, cartItem) in
            if productModel.id == cartItem.productModel.id  {
                cartItem.amount -= 1
                if cartItem.amount == 0 {
                    cartItems.remove(at: index)
                }
                NotificationCenter.default.post(name: .amountChanged, object: nil, userInfo: nil)
                return
            }
        }
    }
    
    func remove(productModel: ProductItemModel) {
        cartItems.enumerated().forEach { (index, cartItem) in
            if productModel.id == cartItem.productModel.id  {
                cartItems.remove(at: index)
                NotificationCenter.default.post(name: .amountChanged, object: nil, userInfo: nil)
                return
            }
        }
    }
    
    func clear() {
        cartItems = []
    }
}
