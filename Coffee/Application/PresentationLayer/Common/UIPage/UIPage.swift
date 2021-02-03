//
//  UIPage.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - UIPage

protocol UIPage {

    associatedtype UIElementType: UIElement

    /// Make some UI element testable
    /// - Parameter view: some ui element
    /// - Parameter element: element description
    func testify(_ view: UIAccessibilityIdentification, using element: UIElementType)
}

extension UIPage {

    func testify(_ view: UIAccessibilityIdentification, using element: UIElementType) {
        view.accessibilityIdentifier = element.accessibilityIdentifier
    }
}
