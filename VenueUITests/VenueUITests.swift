//
//  VenueUITests.swift
//  VenueUITests
//
//  Created by Дмитрий Савинов on 10.02.2021.
//
// swiftlint:disable all

import XCTest
import Nimble

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

    private var activityIndicator: XCUIElement {
        activityIndicator(.activityIndicator)
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

    /// Нажатие на кнопку continue, после ввода корректного email-адреса
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода некорректный email (по типу therun@ya.ru)*
    /// *3. Нажимаем на continue.*
    ///
    /// **Проверка:**
    /// *1. После нажатия кнопка находится в состоянии disabled.*
    /// *2. Есть спиннер активности.*
    /// *3. Поле для ввода не доступно для редактирования.*
    /// *4. Клавиатура скрыта.*
    ///
    /// Ключ: n0q5rt1b79s3qkzo9
    func testSVMR12() {

        /// given

        let test12String = Constants.correctMail.rawValue

        /// when

        app.launch()
        mailTextField.typeText(test12String)
        continueButton.tap()

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        let textFieldIsEditing = !mailTextField.isSelected
        //let indicator = activityIndicator
        XCTAssert(isElementsExist)
        XCTAssert(!isButtonEnabled)
        XCTAssert(textFieldIsEditing)
        XCTAssertEqual(app.keyboards.count, 0)
        //expect(indicator.exists).toEventually(equal(true))
    }

    /// Скрытие клавиатуры по нажатию вне ее области отображения и не на поле ввода.
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Нажимаем вне ее области отображения и не на поле ввода.*
    ///
    /// **Проверка:**
    /// *1. Текстовое поле в состоянии is not editing.*                                                              *
    /// *2. Клавиатура скрыта.*
    /// *3. Кнопка находится в состоянии disabled.*
    ///
    /// Ключ: oyh5fok2cqafudkbl
    func testSVMR13() {

        /// when

        app.launch()
        welcomeLabel.tap()

        /// then

        let isButtonEnabled = continueButton.isEnabled
        let textFieldIsEditing = !mailTextField.isSelected
        XCTAssert(!isButtonEnabled && textFieldIsEditing)
        XCTAssertEqual(app.keyboards.count, 0)
    }

    /// Скрытие клавиатуры по нажатию вне ее области отображения и не на поле ввода.
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Нажимаем вне ее области отображения и не на поле ввода.*
    ///
    /// **Проверка:**
    /// *1. Текстовое поле в состоянии is not editing.*                                                              *
    /// *2. Клавиатура скрыта.*
    /// *3. Кнопка находится в состоянии disabled.*
    ///
    /// Ключ: oyh5fok2cqafudkbl
    func testSVMR14() {

        /// when

        app.launch()
        app.buttons[Constants.Keyboard.enter.rawValue].tap()

        /// then

        let isButtonEnabled = continueButton.isEnabled
        let textFieldIsEditing = !mailTextField.isSelected
        XCTAssert(!isButtonEnabled && textFieldIsEditing)
        expect(self.app.keyboards.count).toEventually(equal(0))
    }

    /// Не скрытие клавиатуры по нажатию на поле ввода.
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Нажимаем на поле ввода.*
    ///
    /// **Проверка:**
    /// *1. Текстовое поле в состоянии is editing.*                                                              *
    /// *2. Клавиатура не скрыта.*
    /// *3. Кнопка находится в состоянии disabled.*
    ///
    /// Ключ: f9ufkfon6x866byuy
    func testSVMR15() {

        /// when

        app.launch()
        mailTextField.tap()

        /// then

        let isButtonEnabled = continueButton.isEnabled
        let textFieldIsEditing = mailTextField.isSelected
        XCTAssert(!isButtonEnabled && !textFieldIsEditing)
        XCTAssertEqual(app.keyboards.count, 1)
    }

    /// Отображение поля и кнопки continue на дисплеях ipad.
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
    /// *7. Ширина кнопки continue и поля ввода не больше 370.*
    ///
    /// Ключ: f9ufkfon6x866byuy
    func testSVMR16() {

        /// when

        app.launch()

        /// then

        let isElementsExist = mailTextField.exists &&
            continueButton.exists &&
            welcomeLabel.exists &&
            imageView.exists
        let isButtonEnabled = continueButton.isEnabled
        let signInButtonWidthIsCorrect = continueButton.frame.width <= Constants.UI.SignInButton.width.rawValue
        let mailTextFieldIsCorrect = continueButton.frame.width <= Constants.UI.MailTextField.width.rawValue
        XCTAssert(isElementsExist && !isButtonEnabled && signInButtonWidthIsCorrect && mailTextFieldIsCorrect)
    }

    /// Отображение клавиатуры на различных моделях устройств.
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
    /// *7. Клавиатура не имеет горизонтального пересечения с кнопкой.*
    ///
    /// Ключ: nmo0b4mbg3fcxz0h3
    func testSVMR17() {

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
}
