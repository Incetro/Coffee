//
//  Designer.swift
//  Coffee
//
//  Created by Дмитрий Савинов on 23.10.2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - Designer

protocol Designer {

    /// Current stored theme
    var appearance: Appearance { get }

    /// True if user has enabled system appearance
    var isSystemAppearanceEnabled: Bool { get }

    /// Add new appearance observer
    ///
    /// - Parameter designable: new appearance observer
    func add(designable: Designable)

    /// Add new appearance observer
    ///
    /// - Parameter designable: new appearance observer
    func add(designable: Designable, withImmediateCall immediateCall: Bool)

    /// Set new appearance
    ///
    /// - Parameters:
    ///   - appearance: new appearance instance
    ///   - animationDuration: changing appearance animation duration
    func set(appearance: Appearance, animationDuration: Double, isAnimated: Bool)

    /// Set new appearance
    ///
    /// - Parameters:
    ///   - appearance: new appearance instance
    ///   - animationDuration: changing appearance animation duration
    func set(appearance: AppearanceType, animationDuration: Double, isAnimated: Bool)
}

extension Designer {

    /// Set new appearance
    ///
    /// - Parameter apperance: new appearance instance
    func set(apperance: Appearance) {
        set(appearance: appearance, animationDuration: 0.25, isAnimated: true)
    }

    /// Set new appearance
    ///
    /// - Parameters:
    ///   - appearance: new appearance instance
    func set(appearance: AppearanceType) {
        set(appearance: appearance, animationDuration: 0.25, isAnimated: true)
    }
}
