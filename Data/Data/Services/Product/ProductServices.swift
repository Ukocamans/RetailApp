//
//  ProductServices.swift
//  Data
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation
import Core

public protocol ProductServicesProtocol {
    func listing(completion: @escaping (NetworkResult<ProductListResponseModel>) -> Void)
}

public class ProductServices: ProductServicesProtocol {
    
    public init() {}
    
    public func listing(completion: @escaping (NetworkResult<ProductListResponseModel>) -> Void) {
        let request = ProductListRequest()
        request.send(reqModel: EmptyRequestModel()) { (result) in
            completion(result)
        }
    }
}


