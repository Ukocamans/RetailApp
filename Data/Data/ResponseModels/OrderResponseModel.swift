//
//  OrderResponseModel.swift
//  Data
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation

public struct OrderResponseModel: Codable {
    public let status: StatusType?
    public let message: String?
}


public enum StatusType: String, Codable {
    case success = "success"
    case failed = "error"
}
