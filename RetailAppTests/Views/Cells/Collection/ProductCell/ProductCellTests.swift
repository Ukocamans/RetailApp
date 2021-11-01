//
//  ProductCellTests.swift
//  RetailAppTests
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 2.11.2021.
//

import XCTest
@testable import RetailApp
@testable import Data


final class ProductCellTests: XCTestCase {

    private var sut: ProductCell!

    override func setUp() {
        sut = UINib(nibName: "ProductCell", bundle: nil).instantiate(withOwner: self, options: nil).first as? ProductCell
    }

    func testSetupCell() {
        // Given
        let data = ProductItemModel(with: ProductModel(id: 1, name: "test", price:"1", currency: "TRY", image: ""))

        // When
        sut.configure(with: data)

        // Then
        XCTAssertEqual(data.title, sut.labelTitle.text)
        XCTAssertEqual(data.price, sut.labelPrice.text)
    }
}
