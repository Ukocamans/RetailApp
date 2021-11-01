//
//  AlertPresentable.swift
//  Core
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//  Copyright © 2020 ING TR. All rights reserved.
//

import UIKit

public protocol AlertPresentable where Self: UIViewController {
    func show(alert: Alert, style: UIAlertController.Style)
    func showMessage(title: String, message: String, buttonTitle: String)
}

extension AlertPresentable {

    public func show(alert: Alert, style: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: alert.title,
                                      message: alert.message,
                                      preferredStyle: style)

        alert.actions.forEach { (action) in
            let alertAction = UIAlertAction(title: action.title, style: action.style, handler: { _ in
                action.action()
            })
            alertController.addAction(alertAction)
            if action.isPreffered {
                alertController.preferredAction = alertAction
            }
        }
        if let color = alert.tintColor {
            alertController.view.tintColor = color
        }

        present(alertController, animated: true, completion: nil)
    }

    /// Show a simple alert with title, alert message and a single close  action
    public func showMessage(title: String, message: String, buttonTitle: String) {
        let defaultAction = AlertAction(title: buttonTitle)
        let alert = Alert(title: title, message: message, actions: [defaultAction])
        show(alert: alert)
    }
}
