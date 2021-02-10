//
//  DesignerImplementation.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - DesignerImplementation

final class DesignerImplementation {

    // MARK: - Aliases

    typealias DesignBlock = (Designable) -> Void

    // MARK: - Properties

    /// Current stored theme
    private(set) var appearance: Appearance = {
        Dark(accent: .init(hexString: "#FFFFFF"))
    }()

    /// True if user has enabled system appearance
    var isSystemAppearanceEnabled: Bool {
        true
    }

    /// Current observers
    private var observers = ObserverList<DesignBlock>()

    /// UIWindow instance
    private let window: UIWindow

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - window: UIWindow instance
    init(window: UIWindow) {
        self.window = window
        overrideUserInterfaceStyle()
    }

    // MARK: - Private

    private func appearance(from type: AppearanceType) -> Appearance {
        switch type {
        case .light:
            return Light(accent: .init(hexString: "#000000"))
        case .dark:
            return Dark(accent: .init(hexString: "#FFFFFF"))
        }
    }

    private func overrideUserInterfaceStyle() {
        if #available(iOS 13.0, *) {
            let appearanceSettings = "system"
            switch appearanceSettings {
            case "system":
                window.overrideUserInterfaceStyle = .unspecified
            default:
                window.overrideUserInterfaceStyle = appearance.userInterfaceStyle
            }
        }
    }
}

// MARK: - Designer

extension DesignerImplementation: Designer {

    func add(designable: Designable) {
        add(designable: designable, withImmediateCall: true)
    }

    func add(designable: Designable, withImmediateCall immediateCall: Bool) {
        observers.addObserver(disposable: designable) { [weak self] designable in
            guard let `self` = self else {
                return
            }
            designable.design(appearance: self.appearance)
        }
        if immediateCall {
            designable.design(appearance: appearance)
        }
    }

    func set(appearance: Appearance, animationDuration: Double, isAnimated: Bool) {
        self.appearance = appearance
        overrideUserInterfaceStyle()
        let animationBlock = {
            self.observers.forEach { object, block in
                if let designable = object as? Designable {
                    block(designable)
                }
            }
        }
        if isAnimated {
            UIView.animate(withDuration: animationDuration, animations: animationBlock)
        } else {
            animationBlock()
        }
    }

    func set(appearance: AppearanceType, animationDuration: Double, isAnimated: Bool) {
        let newAppearance = self.appearance(from: appearance)
        set(appearance: newAppearance, animationDuration: animationDuration, isAnimated: isAnimated)
    }
}
