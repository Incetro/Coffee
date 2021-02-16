//
//  BasePage.swift
//  VenueUITests
//
//  Created by Дмитрий Савинов on 15.02.2021.
//

import Foundation

class BasePage<Element: UIElement>: UIPage {

    typealias UIElementType = Element

    // MARK: - Properties

    var uiTest: BaseTest

    // MARK: - Initializers

    init(uiTest: BaseTest) {
        self.uiTest = uiTest
    }

    // MARK: - Common

    @discardableResult
    func open() -> Self {
        app.launch()
        return self
    }
}
