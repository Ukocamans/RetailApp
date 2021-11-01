//
//  CartCellTests.swift
//  RetailAppTests
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 2.11.2021.
//

import XCTest
@testable import RetailApp
@testable import Data


final class CartCellTests: XCTestCase {

    private var sut: CartCell!

    override func setUp() {
        sut = UINib(nibName: "CartCell", bundle: nil).instantiate(withOwner: self, options: nil).first as? CartCell
    }

    func testSetupCell() {
        // Given
        let productItem = ProductItemModel(with: ProductModel(id: 1, name: "test", price:"1", currency: "TRY", image: ""))
        let data = CartItemModel(model: productItem)

        // When
        sut.configure(with: data)

        // Then
        XCTAssertEqual(data.productModel.title, sut.labelTitle.text)
        XCTAssertEqual(data.productModel.price, sut.labelPrice.text)
        XCTAssertEqual("\(data.amount)", sut.labelAmount.text)
    }
}
