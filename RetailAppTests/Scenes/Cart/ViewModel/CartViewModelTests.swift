//
//  CartViewModelTests.swift
//  RetailAppTests
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 2.11.2021.
//

import XCTest
@testable import RetailApp
@testable import Core
@testable import Data

final class CartViewModelTests: XCTestCase {
    private var sut: CartViewModel!
    private var controller: MockCartViewController!
    private var cartServices: MockCartServices!

    override func setUp() {
        cartServices = MockCartServices()

        sut = CartViewModel(cartServices: cartServices)
        controller = MockCartViewController()
        sut.delegate = controller
    }

    func testOrderSuccess() throws {
        // When
        sut.order()

        // Then
        XCTAssertEqual(controller.outputs, [
            .setLoading(true),
            .setLoading(false),
            .finished
        ])
    }

    func testOrderFailed() throws {
        // Given
        cartServices.isOrderSuccess = false
        
        // When
        sut.order()

        // Then
        XCTAssertEqual(controller.outputs, [
            .setLoading(true),
            .setLoading(false),
            .error(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: ""]))
        ])
    }
    
    func testOrderOutOfStock() {
        // Given
        cartServices.isOrderSuccess = false
        cartServices.isOrderOutOfStock = true
        
        // When
        sut.order()

        // Then
        XCTAssertEqual(controller.outputs, [
            .setLoading(true),
            .setLoading(false),
            .error(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "out of stock"]))
        ])
    }
}

private final class MockCartViewController: CartViewModelDelegate {
    var outputs: [CartViewModelOutput] = []

    func handleViewModelOutput(output: CartViewModelOutput) {
        outputs.append(output)
    }
}

// MARK: - Mock Services

private final class MockCartServices: CartServicesProtocol {
    var isOrderSuccess = true
    var isOrderOutOfStock = false
    func order(requestModel: OrderRequestModel, completion: @escaping (NetworkResult<OrderResponseModel>) -> Void) {
        if isOrderSuccess {
            completion(.success(OrderResponseModel(status: .success, message: "")))
        } else if isOrderOutOfStock {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "out of stock"])
            completion(.failure(error))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: ""])
            completion(.failure(error))
        }
    }
}
