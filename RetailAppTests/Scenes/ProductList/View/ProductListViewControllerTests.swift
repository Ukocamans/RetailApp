//
//  ProductListViewControllerTests.swift
//  RetailAppTests
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import XCTest
@testable import RetailApp
@testable import Data
@testable import Core

final class ProductListViewControllerTests: XCTestCase {
    private var sut: ProductListViewController!
    private var viewModel: MockProductListViewModel!

    override func setUp() {
        viewModel = MockProductListViewModel()
        sut = ProductListViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
    }

    func testLoad() {
        XCTAssertTrue(viewModel.isDataLoaded)
    }
}

private final class MockProductListViewModel: ProductListViewModelProtocol {
    var delegate: ProductListViewModelDelegate?
    var isDataLoaded = false
    
    func loadData() {
        isDataLoaded = true
    }
    
    func getProducts() -> [ProductItemModel] {
        []
    }
}
