//
//  CartServices.swift
//  Data
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation
import Core

protocol CartServicesProtocol {
    func order(requestModel: OrderRequestModel, completion: @escaping (NetworkResult<OrderResponseModel>) -> Void)
}

public class CartServices: CartServicesProtocol {
    
    public init() {}
    
    public func order(requestModel: OrderRequestModel, completion: @escaping (NetworkResult<OrderResponseModel>) -> Void) {
        let request = OrderRequest()
        request.send(reqModel: requestModel) { (result) in
            completion(result)
        }
    }
}
