//
//  UIPage.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - UIPage

/// Protocol which desribes some view
/// representation in slightly different
/// abstraction
protocol UIPage {

    /// An element type which will describe
    /// certain view
    associatedtype UIElementType: UIElement

    /// Mark the given view as testable view
    /// - Parameters:
    ///   - view: target view
    ///   - element: view description
    func testify(
        _ view: UIAccessibilityIdentification,
        using element: UIElementType
    )
}

// MARK: - Default

extension UIPage {

    /// Mark the given view as testable view
    /// - Parameters:
    ///   - view: target view
    ///   - element: view description
    func testify(_ view: UIAccessibilityIdentification, using element: UIElementType) {
        view.accessibilityIdentifier = element.accessibilityIdentifier
    }
}
