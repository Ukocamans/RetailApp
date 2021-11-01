//
//  ProductItemModel.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation
import Data

struct ProductItemModel {
    let id: Int?
    let url: String?
    let title: String?
    let price: String?
    var action: (() -> Void)?
    
    init(with model: ProductModel) {
        self.id = model.id ?? -1
        self.url = model.image
        self.title = model.name
        self.price = (model.price ?? "") + " " + (model.currency ?? "")
    }
}
