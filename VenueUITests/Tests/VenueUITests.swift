//
//  VenueUITests.swift
//  VenueUITests
//
//  Created by Дмитрий Савинов on 10.02.2021.
//
// swiftlint:disable all

import XCTest
import Nimble

final class VenueUITests: BaseTest {

    private lazy var signInPage = SignInPage(uiTest: self)

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

        /// given

        initialState.launch()

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
            .verifyTextFieldEditing(to: true)
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
        let login = String.random(withCharactersInString: characters, minimumLength: 1, maximumLength: 2)
        initialState.launch()

        /// when

        signInPage.typeLogin(login)

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
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
        let login = String.random(withCharactersInString: characters, minimumLength: 1, maximumLength: 18)
        initialState.launch()

        /// when

        signInPage.typeLogin(login)

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
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
        let login = String.random(withCharactersInString: characters, minimumLength: 1, maximumLength: 18)
        initialState.launch()

        /// when

        signInPage.typeLogin(login)

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
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
        let login = String.random(withCharactersInString: characters, ofLength: 2)
        initialState.launch()
        
        /// when

        signInPage.typeLogin(login)

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
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
        let login = String.random(withCharactersInString: characters + digits, ofLength: 7)
        initialState.launch()

        /// when

        signInPage.typeLogin(login)

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
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

        let login = Constants.correctMail.rawValue
        initialState.launch()

        /// when

        signInPage.typeLogin(login)

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: true)
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

        let login = Constants.test8.rawValue
        initialState.launch()

        /// when

        signInPage.typeLogin(login)

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
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

        let login = Constants.test9.rawValue
        initialState.launch()

        /// when

        signInPage.typeLogin(login)

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
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

        let login = Constants.test10.rawValue
        initialState.launch()

        /// when

        signInPage.typeLogin(login)

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
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

        let login = Constants.test11.rawValue
        initialState.launch()

        /// when

        signInPage.typeLogin(login)

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
    }

    /// Нажатие на кнопку continue, после ввода корректного email-адреса
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Вводим в поле для ввода корректный email (по типу therun@ya.ru)*
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

        let login = Constants.correctMail.rawValue
        initialState.launch()

        /// when

        signInPage
            .typeLogin(login)
            .tapContinueButton()

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
            .verifyKeyboard(to: false)
//            .verifyIndicatorExistance(to: true)
//            .verifyTextFieldEnable(to: false)
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

        /// given

        initialState.launch()

        /// when

        signInPage.tapWelcomeLabel()

        /// then
        
        signInPage
            .verifyContinueButton(to: false)
            .verifyKeyboard(to: false)
            .verifyTextFieldEditing(to: false)
    }

    /// Скрытие клавиатуры по нажатию на enter.
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Нажимаем на клавишу enter клавиатуры.*
    ///
    /// **Проверка:**
    /// *1. Текстовое поле в состоянии is not editing.*                                                              *
    /// *2. Клавиатура скрыта.*
    /// *3. Кнопка находится в состоянии disabled.*
    ///
    /// Ключ: oyh5fok2cqafudkbl
    func testSVMR14() {

        /// given

        initialState.launch()

        /// when

        signInPage.tapKeyboardButton(.enter)

        /// then

        signInPage
            .verifyContinueButton(to: false)
            .verifyTextFieldEditing(to: false)
            .verifyKeyboard(to: false)
    }

    /// Не скрытие клавиатуры по нажатию на поле ввода.
    ///
    /// **Действия:**
    /// *1. Запускаем приложение на экране авторизации*
    /// *2. Нажимаем на поле ввода.*
    ///
    /// **Проверка:**
    /// *1. Текстовое поле в состоянии is editing.*
    /// *2. Клавиатура не скрыта.*
    /// *3. Кнопка находится в состоянии disabled.*
    ///
    /// Ключ: f9ufkfon6x866byuy
    func testSVMR15() {

        /// given

        initialState.launch()


        /// when

        signInPage.tapLogin()

        /// then

        signInPage
            .verifyContinueButton(to: false)
            .verifyTextFieldEditing(to: true)
            .verifyKeyboard(to: true)
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

        /// given

        initialState.launch()

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
            .verifyContinueButtonWidth()
            .verifyLoginTextFieldWidth()
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

        /// given

        initialState.launch()

        /// then

        signInPage
            .verifyStackElementsExistence(to: true)
            .verifyContinueButton(to: false)
            .verifyKeyboardIntersectionWithStack(to: false)
    }
}
