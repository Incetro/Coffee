//
//  CMHUDAppearance.swift
//  CMUI
//
//  Created by incetro on 2/22/20.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//
// swiftlint:disable extension_access_modifier
//

import UIKit

// MARK: - CMHUDAppearance

public struct CMHUDAppearance {

    // MARK: - Properties

    /// HUD background blur color
    let backgroundColor: UIColor

    /// Images/Progress background color
    let centralViewBackgroundColor: UIColor

    /// Images/Progress color
    let centralViewContentColor: UIColor

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - backgroundColor: HUD background blur color
    ///   - centralViewBackgroundColor: Images/Progress background color
    ///   - centralViewContentColor: Images/Progress color
    public init(backgroundColor: UIColor, centralViewBackgroundColor: UIColor, centralViewContentColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.centralViewBackgroundColor = centralViewBackgroundColor
        self.centralViewContentColor = centralViewContentColor
    }
}

extension CMHUDAppearance {

    static public var standard: CMHUDAppearance {
        CMHUDAppearance(
            backgroundColor: UIColor(hexString: "#8A8A8F").withAlphaComponent(0.38),
            centralViewBackgroundColor: UIColor(red: 138, green: 138, blue: 143).withAlphaComponent(0.62),
            centralViewContentColor: .white
        )
    }
}
