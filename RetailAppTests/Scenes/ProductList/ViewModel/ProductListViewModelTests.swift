//
//  ProductListViewModelTests.swift
//  RetailAppTests
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import XCTest
@testable import RetailApp
@testable import Core
@testable import Data

final class ProductListViewModelTests: XCTestCase {
    private var sut: ProductListViewModel!
    private var controller: MockProductListViewController!
    private var productServices: MockProductServices!

    override func setUp() {
        productServices = MockProductServices()

        sut = ProductListViewModel(productServices: productServices)
        controller = MockProductListViewController()
        sut.delegate = controller
    }

    func testProductListingSuccess() throws {
        // When
        sut.loadData()

        // Then
        XCTAssertEqual(controller.outputs, [
            .setLoading(true),
            .setLoading(false),
            .finished
        ])
    }

    func testProductListingFailed() throws {
        // Given
        productServices.isListingSuccess = false
        
        // When
        sut.loadData()

        // Then
        XCTAssertEqual(controller.outputs, [
            .setLoading(true),
            .setLoading(false),
            .error(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: ""]))
        ])
    }
}

private final class MockProductListViewController: ProductListViewModelDelegate {
    var outputs: [ProductListViewModelOutput] = []

    func handleViewModelOutput(output: ProductListViewModelOutput) {
        outputs.append(output)
    }
}

// MARK: - Mock Services

private final class MockProductServices: ProductServicesProtocol {
    var isListingSuccess = true
    func listing(completion: @escaping (NetworkResult<ProductListResponseModel>) -> Void) {
        if isListingSuccess {
            completion(.success([]))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: ""])
            completion(.failure(error))
        }
    }
}
