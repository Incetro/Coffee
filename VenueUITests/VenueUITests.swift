//
//  VenueUITests.swift
//  VenueUITests
//
//  Created by Дмитрий Савинов on 10.02.2021.
//
// swiftlint:disable all

import XCTest

final class VenueUITests: XCTestCase {

    private enum Keys {
        static let mailTextField = "E-mail adress"
        static let continueButton = "Continue"
        static let welcomeLabel = "Welcome to\nVenue!"
        static let imageView = "logo"
    }

    private let app = XCUIApplication()

    private let scrollViewsQuery = XCUIApplication().scrollViews

    private lazy var elementsQuery = scrollViewsQuery.otherElements

    private var mailTextField: XCUIElement {
        elementsQuery.textFields[Keys.mailTextField]
    }

    private var continueButton: XCUIElement {
        elementsQuery.buttons[Keys.continueButton]
    }

    private var welcomeLabel: XCUIElement {
        elementsQuery.staticTexts[Keys.welcomeLabel]
    }

    private var imageView: XCUIElement {
        elementsQuery.containing(.image, identifier: Keys.imageView).element
    }

    /// Начальное открытие экрана авторизации (ввода email)
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка по умолчанию находится в состоянии disabled*
    ///
    /// Ключ: nyh5km4fu9p1w0nkm
    func testSVMR1() {
        app.launch()
        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        XCTAssert(isElementsExist && !isButtonEnabled)
    }

    /// Ввод 1-2 букв в поле для ввода email
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода 1-2 буквы*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка находится в состоянии disabled*
    ///
    /// Ключ: 2kgp7eyx15k0tq6nn
    func testSVMR2() {
        app.launch()
        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        let oneCharString = "g"
        let twoCharString = "sh"
        mailTextField.typeText(oneCharString)
        XCTAssert(isElementsExist && !isButtonEnabled)
        mailTextField.clearAndEnterText(twoCharString)
        XCTAssert(isElementsExist && !isButtonEnabled)
    }

    /// Ввод 1-18 цифр в поле для ввода email
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода 1-18 цифр*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка находится в состоянии disabled*
    ///
    /// Ключ: 15kvo5v6udc4ddbth
    func testSVMR3() {
    }
}
