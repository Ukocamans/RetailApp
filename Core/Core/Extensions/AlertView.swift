//
//  AlertView.swift
//  Core
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//  Copyright © 2020 ING TR. All rights reserved.
//

import UIKit

public struct Alert: Equatable {
    let title: String
    let message: String
    let tintColor: UIColor?
    let actions: [AlertAction]

    public init(
        title: String,
        message: String,
        tintColor: UIColor? = nil,
        actions: [AlertAction]
    ) {
        self.title = title
        self.message = message
        self.tintColor = tintColor
        self.actions = actions
    }
}

public typealias AlertActionBlock = (() -> Void)

public struct AlertAction: Equatable {
    let title: String
    let style: UIAlertAction.Style
    let action: () -> Void?
    let isPreffered: Bool

    public init(
        title: String,
        style: UIAlertAction.Style = .default,
        isPreffered: Bool = false,
        action: @autoclosure @escaping () -> Void? = nil
    ) {
        self.style = style
        self.title = title
        self.action = action
        self.isPreffered = isPreffered
    }

    public static func == (lhs: AlertAction, rhs: AlertAction) -> Bool {
        return lhs.title == rhs.title
    }
}

extension Alert {
    public func tapActionButton(atIndex index: Int) {
        let block = actions[index].action
        block()
    }
}
