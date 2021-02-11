//
//  BaseTest.swift
//  VenueUITests
//
//  Created by Дмитрий Савинов on 11.02.2021.
//
// swiftlint:disable all

import Foundation
import XCTest

// MARK: - BaseTest

class BaseTest: XCTestCase {

    // MARK: - Properties

    var uiTest: BaseTest {
        self
    }

    private var currentTestName: String {
        String(describing: type(of: self))
    }

    // MARK: - XCTestCase

    override func setUp() {
        continueAfterFailure = false
    }
}
