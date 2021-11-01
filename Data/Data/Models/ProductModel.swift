//
//  ProductModel.swift
//  Data
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation

public struct ProductModel: Codable {
    public let id: Int?
    public let name, price, currency: String?
    public let image: String?
    
    public init(id: Int?, name: String?, price: String?, currency: String?, image: String?) {
        self.id = id
        self.name = name
        self.price = price
        self.currency = currency
        self.image = image
    }
}
