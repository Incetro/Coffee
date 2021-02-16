//
//  InitialState.swift
//  TheRunUITests
//
//  Created by Alexander Lezya on 15.02.2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import XCTest

// MARK: - InitialState

final class InitialState {

    // MARK: - Properties

    /// Current application instance
    private let app: XCUIApplication

    /// Current test name
    private let testName: String

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter app: current application instance
    init(app: XCUIApplication, testName: String) {
        self.app = app
        self.testName = testName
        simpleSetup()
    }

    /// Simple test application settings
    private func simpleSetup() {
        app.launchArguments.append("UITest")
    }

    /// Setup initial screen
    ///
    /// - Parameter screen: initial screen
    /// - Returns: current instance
    func launch() {
        app.launch()
    }
}
