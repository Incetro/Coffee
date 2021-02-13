//
//  VenueUITests.swift
//  VenueUITests
//
//  Created by Дмитрий Савинов on 10.02.2021.
//
// swiftlint:disable all

import XCTest

final class VenueUITests: BaseTest, UIPage {

    typealias UIElementType = AccessibilityHierarchy.SignIn

    private var mailTextField: XCUIElement {
        textField(.mailTextField)
    }

    private var continueButton: XCUIElement {
        button(.signInButton)
    }

    private var welcomeLabel: XCUIElement {
        label(.welcomeLabel)
    }

    private var imageView: XCUIElement {
        image(.headerImageView)
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

        /// when
        app.launch()

        /// then

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

        /// given

        let characters = Constants.Letters.English.lowerCase.rawValue
        let twoCharString = String.random(withCharactersInString: characters, minimumLength: 1, maximumLength: 2)

        /// when

        app.launch()
        mailTextField.typeText(twoCharString)

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
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

        /// given

        let characters = Constants.digits.rawValue
        let digitString = String.random(withCharactersInString: characters, minimumLength: 1, maximumLength: 18)

        /// when

        app.launch()
        mailTextField.typeText(digitString)

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        XCTAssert(isElementsExist && !isButtonEnabled)
    }

    /// Ввод 1-18 спец символов в поле для ввода email
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода 1-18 спец символов*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка находится в состоянии disabled*
    ///
    /// Ключ: ri9ra9h2edtxxk70r
    func testSVMR4() {

        /// given

        let characters = Constants.specialSybols.rawValue
        let cpecialSymbolsString = String.random(withCharactersInString: characters, minimumLength: 1, maximumLength: 18)

        /// when

        app.launch()
        mailTextField.typeText(cpecialSymbolsString)

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        XCTAssert(isElementsExist && !isButtonEnabled)
    }

    /// Ввод в поле email 1 буквы с символом _
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода 1 букву с символом _*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка находится в состоянии disabled*
    ///
    /// Ключ: tktv6i4ugze0k8cpq
    func testSVMR5() {

        /// given

        let characters = String.random(withCharactersInString: Constants.englishTwoCases.rawValue, ofLength: 1) + Constants.test5.rawValue
        let test5String = String.random(withCharactersInString: characters, ofLength: 2)
        
        /// when

        app.launch()
        mailTextField.typeText(test5String)

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        XCTAssert(isElementsExist && !isButtonEnabled)
    }

    /// Ввод цифры и 3 и более букв (включая символ _ ) в поле для ввода email
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода цифру и 3 и более букв (включая символ _ )*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка находится в состоянии disabled*
    ///
    /// Ключ: 3m5in85d3o6a38z8y
    func testSVMR6() {

        /// given

        let digits = String.random(withCharactersInString:Constants.digits.rawValue ,ofLength: 1)
        let characters = String.random(withCharactersInString: Constants.englishTwoCases.rawValue, ofLength: 5) + Constants.test6.rawValue
        let test6String = String.random(withCharactersInString: characters + digits, ofLength: 7)

        /// when

        app.launch()
        mailTextField.typeText(test6String)

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        XCTAssert(isElementsExist && !isButtonEnabled)
    }

    /// Ввод корректного email-адреса
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода корректный email*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка находится в состоянии enabled*
    ///
    /// Ключ: 8tzlmm892fawdmbi6
    func testSVMR7() {

        /// given

        let test7String = Constants.correctMail.rawValue

        /// when

        app.launch()
        mailTextField.typeText(test7String)

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        XCTAssert(isElementsExist && isButtonEnabled)
    }

    /// Ввод некорректного email-адреса (therun@)
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода некорректный email (по типу therun@)*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка находится в состоянии disabled*
    ///
    /// Ключ: q2n7oboyu661fe6yh
    func testSVMR8() {

        /// given

        let test8String = Constants.test8.rawValue

        /// when

        app.launch()
        mailTextField.typeText(test8String)

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        XCTAssert(isElementsExist && !isButtonEnabled)
    }

    /// Ввод некорректного email-адреса (therun@ya)
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода некорректный email (по типу therun@ya)*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка находится в состоянии disabled*
    ///
    /// Ключ: q2n7oboyu661fe6yh
    func testSVMR9() {

        /// given

        let test9String = Constants.test9.rawValue

        /// when

        app.launch()
        mailTextField.typeText(test9String)

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        XCTAssert(isElementsExist && !isButtonEnabled)
    }

    /// Ввод некорректного email-адреса (therun@ya.)
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода некорректный email (по типу therun@ya.)*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка находится в состоянии disabled*
    ///
    /// Ключ: couzulhic8bx7a4gr
    func testSVMR10() {

        /// given

        let test10String = Constants.test10.rawValue

        /// when

        app.launch()
        mailTextField.typeText(test10String)

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        XCTAssert(isElementsExist && !isButtonEnabled)
    }

    /// Ввод некорректного email-адреса (therun@ya.r)
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода некорректный email (по типу therun@ya.r)*
    ///
    /// **Проверка:**
    /// *1. Есть картинка с лого*
    /// *2. Есть надпись под картинкой*
    /// *3. Есть описание над полем ввода*
    /// *4. Есть поле для ввода с плейсхолдером*
    /// *5. Есть кнопка продолжения*
    /// *6. Кнопка находится в состоянии disabled*
    ///
    /// Ключ: couzulhic8bx7a4gr
    func testSVMR11() {

        /// given

        let test11String = Constants.test11.rawValue

        /// when

        app.launch()
        mailTextField.typeText(test11String)

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        XCTAssert(isElementsExist && !isButtonEnabled)
    }
}
