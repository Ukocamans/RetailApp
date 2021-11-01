//
//  CartManagerTests.swift
//  RetailAppTests
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 2.11.2021.
//

import XCTest
@testable import RetailApp
@testable import Data


final class CartManagerTests: XCTestCase {

    private var sut: CartManager!

    override func setUp() {
        sut = CartManager.shared
    }

    func testAdd() {
        //Given
        sut.cartItems = []
        
        //When
        sut.add(productModel: ProductItemModel(with: ProductModel(id: 1, name: "test", price:"1", currency: "TRY", image: "")))

        //Then
        XCTAssertEqual(sut.cartItems.count, 1)
    }
    
    func testAddMultipleSameItems() {
        //Given
        sut.cartItems = []
        
        // When
        sut.add(productModel: ProductItemModel(with: ProductModel(id: 1, name: "test", price:"1", currency: "TRY", image: "")))
        sut.add(productModel: ProductItemModel(with: ProductModel(id: 1, name: "test", price:"1", currency: "TRY", image: "")))

        //Then
        XCTAssertEqual(sut.cartItems.count, 1)
        XCTAssertEqual(sut.cartItems.first?.amount, 2)
    }
    
    func testSubstract() {
        //Given
        sut.cartItems = []
        
        // When
        sut.add(productModel: ProductItemModel(with: ProductModel(id: 1, name: "test", price:"1", currency: "TRY", image: "")))
        sut.add(productModel: ProductItemModel(with: ProductModel(id: 1, name: "test", price:"1", currency: "TRY", image: "")))
        sut.substract(productModel: ProductItemModel(with: ProductModel(id: 1, name: "test", price:"1", currency: "TRY", image: "")))

        //Then
        XCTAssertEqual(sut.cartItems.count, 1)
        XCTAssertEqual(sut.cartItems.first?.amount, 1)
    }
    
    func testSubstractAllItems() {
        //Given
        sut.cartItems = []
        
        // When
        sut.add(productModel: ProductItemModel(with: ProductModel(id: 1, name: "test", price:"1", currency: "TRY", image: "")))
        sut.substract(productModel: ProductItemModel(with: ProductModel(id: 1, name: "test", price:"1", currency: "TRY", image: "")))

        //Then
        XCTAssertEqual(sut.cartItems.count, 0)
    }
    
    func testClear() {
        //When
        sut.clear()
        
        //Then
        XCTAssertEqual(sut.cartItems.count, 0)
    }
}


