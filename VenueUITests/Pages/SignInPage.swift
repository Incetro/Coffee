//
//  SignInPage.swift
//  VenueUITests
//
//  Created by Дмитрий Савинов on 15.02.2021.
//
// swiftlint:disable all

import Foundation
import XCTest
import Nimble

final class SignInPage: BasePage<AccessibilityHierarchy.SignIn> {

    // MARK: - Private

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

    private var stackView: XCUIElement {
        other(.stackView)
    }

    private var scrollView: XCUIElement {
        scrollView(.scrollView)
    }

    private var isAllStackElementsExist: Bool {
        mailTextField.exists && continueButton.exists &&
        welcomeLabel.exists && imageView.exists
    }

    private var isKeyboardIntersectWithStack: Bool {
        let buttonEndPoint = scrollView.frame.minY + stackView.frame.height
        let keyboardEndPoint = app.keyboards.element(boundBy: 0).frame.minY
        return buttonEndPoint > keyboardEndPoint
    }
    
    private var isContinueButtonWidthCorrect: Bool {
        continueButton.frame.width <= Constants.UI.SignInButton.width.rawValue
    }

    private var isLoginTextFieldWidthCorrect: Bool {
        continueButton.frame.width <= Constants.UI.MailTextField.width.rawValue
    }

    // MARK: - Verification

    @discardableResult
    func verifyContinueButton(to value: Bool) -> SignInPage {
        expect(self.continueButton.isEnabled).to(equal(value))
        return self
    }

    @discardableResult
    func verifyStackElementsExistence(to value: Bool) -> SignInPage {
        expect(self.isAllStackElementsExist).to(equal(value))
        return self
    }

    @discardableResult
    func verifyKeyboardIntersectionWithStack(to value: Bool) -> SignInPage {
        expect(self.isKeyboardIntersectWithStack).toEventually(equal(value))
        return self
    }

    @discardableResult
    func verifyTextFieldEditing(to value: Bool) -> SignInPage {
        expect(self.mailTextField.isSelected).to(equal(value))
        return self
    }

    @discardableResult
    func verifyKeyboard(to value: Bool) -> SignInPage {
        expect(self.app.keyboards.count > 0).toEventually(equal(value))
        return self
    }

    @discardableResult
    func verifyContinueButtonWidth() -> SignInPage {
        expect(self.isContinueButtonWidthCorrect).to(equal(true))
        return self
    }

    @discardableResult
    func verifyLoginTextFieldWidth() -> SignInPage {
        expect(self.isContinueButtonWidthCorrect).to(equal(true))
        return self
    }

    // MARK: - Actions

    @discardableResult
    func typeLogin(_ login: String) -> SignInPage {
        mailTextField.typeText(login)
        return self
    }

    @discardableResult
    func tapContinueButton() -> SignInPage {
        continueButton.tap()
        return self
    }

    @discardableResult
    func tapWelcomeLabel() -> SignInPage {
        welcomeLabel.tap()
        return self
    }

    @discardableResult
    func tapKeyboardButton(_ button: Constants.Keyboard) -> SignInPage {
        app.buttons[button.rawValue].tap()
        return self
    }

    @discardableResult
    func tapLogin() -> SignInPage {
        mailTextField.tap()
        return self
    }
}
