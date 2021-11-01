//
//  AlertPresentableTests.swift
//  RetailAppTests
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 2.11.2021.
//

import XCTest
@testable import RetailApp
@testable import Core

final class AlertPresentableTests: XCTestCase {
    private var controller: DummyController!
    private var window: UIWindow!

    override func setUp() {
        controller = DummyController()
        window = UIWindow()
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

    func testShowErrorAlert() throws {
        // Given
        let message = "Sample message."
        let action = AlertAction(title: "action", style: .default, isPreffered: true, action: nil)
        let alert = Alert(title: "error", message: message, actions: [action])
        
        // When
        controller.show(alert: alert, style: .alert)

        // Then
        let alertController = controller.presentedViewController as? UIAlertController
        XCTAssertNotNil(alertController)
        XCTAssertEqual(alertController?.title, "error")
        XCTAssertEqual(alertController?.message, message)

        let actions = try XCTUnwrap(alertController?.actions)
        XCTAssertEqual(actions.count, 1)
        XCTAssertEqual(actions[0].title, "action")
    }
    
    func testShowMessage() throws {
        //When
        controller.showMessage(title: "error", message: "sample message", buttonTitle: "action")
        
        // Then
        let alertController = controller.presentedViewController as? UIAlertController
        XCTAssertNotNil(alertController)
        XCTAssertEqual(alertController?.title, "error")
        XCTAssertEqual(alertController?.message, "sample message")

        let actions = try XCTUnwrap(alertController?.actions)
        XCTAssertEqual(actions.count, 1)
        XCTAssertEqual(actions[0].title, "action")
    }
}

fileprivate final class DummyController: UIViewController, AlertPresentable { }
