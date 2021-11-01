//
//  OrderRequest.swift
//  Data
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation
import Core

public class OrderRequest:NetworkRequest<OrderRequestModel, OrderResponseModel> {
    public override init() {
        super.init()
        self.endpoint = "/order"
        self.httpMethod = .post
    }
}
