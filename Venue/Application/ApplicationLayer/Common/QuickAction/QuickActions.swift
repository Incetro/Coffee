//
//  QuickActions.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - QuickActions

final class QuickActions {

    // MARK: - Properties

    /// Application identifier
    private let bundleIdentifier: String

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameters:
    ///   - application: target application
    ///   - bundleIdentifier: application identifier
    ///   - actions: actions for installation
    init(_ application: UIApplication, bundleIdentifier: String, actions: [QuickAction] = []) {
        self.bundleIdentifier = bundleIdentifier
        install(actions, toApplication: application)
    }

    // MARK: - Private

    /// Install action
    ///
    /// - Parameters:
    ///   - actions: actions for installation
    ///   - application: target application
    private func install(_ actions: [QuickAction], toApplication application: UIApplication) {
        application.shortcutItems = actions.map {
            $0.toApplicationShortcut(bundleIdentifier)
        }
    }

    // MARK: - Usable

    /// Add some actions to some application
    ///
    /// - Parameters:
    ///   - actions: actions for appending
    ///   - application: target application
    func add(_ actions: [QuickAction], toApplication application: UIApplication) {
        var items = actions.map {
            $0.toApplicationShortcut(bundleIdentifier)
        }
        items.append(contentsOf: application.shortcutItems ?? [])
        application.shortcutItems = items
    }

    /// Add some action to some application
    ///
    /// - Parameters:
    ///   - action: action for appending
    ///   - application: target application
    func add(_ action: QuickAction, toApplication application: UIApplication) {
        add([action], toApplication: application)
    }

    /// Remove the given quick action from the given application
    ///
    /// - Parameters:
    ///   - action: action for deletion
    ///   - application: target application
    func remove(_ action: QuickAction, fromApplication application: UIApplication) {
        if let index = application.shortcutItems?.firstIndex(of: action.toApplicationShortcut(bundleIdentifier)) {
            application.shortcutItems?.remove(at: index)
        }
    }

    /// Remove all shortcut items
    ///
    /// - Parameter application: target application
    func clear(_ application: UIApplication) {
        application.shortcutItems = nil
    }
}
