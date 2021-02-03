//
//  UIElement.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - UIElement

protocol UIElement {

    /// UI element accessibilityIdentifier value (UIKit property analogue)
    var accessibilityIdentifier: String { get }
}

// MARK: - RawRepresentable

extension UIElement where Self: RawRepresentable {
    var accessibilityIdentifier: RawValue {
        rawValue
    }
}
