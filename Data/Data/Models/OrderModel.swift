//
//  OrderModel.swift
//  Data
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation

public struct OrderModel: Codable {
    private let id: Int
    private let amount: Int
    
    public init(id: Int, amount: Int) {
        self.id = id
        self.amount = amount
    }
}
