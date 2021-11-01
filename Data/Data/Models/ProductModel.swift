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
}
