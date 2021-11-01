//
//  CartViewControllerTests.swift
//  RetailAppTests
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 2.11.2021.
//

import XCTest
@testable import RetailApp
@testable import Data
@testable import Core

final class CartViewControllerTests: XCTestCase {
    private var sut: CartViewController!
    private var viewModel: MockCartViewModel!

    override func setUp() {
        viewModel = MockCartViewModel()
        sut = CartViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
    }

    func testOrderButtonAction() {
        //When
        sut.buttonOrder.sendActions(for: .touchUpInside)
        
        //Then
        XCTAssertTrue(viewModel.isOrderGiven)
    }
}

private final class MockCartViewModel: CartViewModelProtocol {
    weak var delegate: CartViewModelDelegate?
    
    var isOrderGiven = false
    
    func order() {
        isOrderGiven = true
    }
}
