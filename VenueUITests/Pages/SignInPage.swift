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

    private var loginTextField: XCUIElement {
        textField(.loginTextField)
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

    // MARK: - Verification

    @discardableResult
    func verifyContinueButton(to value: Bool) -> SignInPage {
        expect(self.continueButton.isEnabled).to(equal(value))
        return self
    }

    @discardableResult
    func verifyStackElementsExistence(to value: Bool) -> SignInPage {
        let expectation = loginTextField.exists && continueButton.exists &&
            welcomeLabel.exists && imageView.exists
        expect(expectation).to(equal(value))
        return self
    }

    @discardableResult
    func verifyKeyboardIntersectionWithStack(to value: Bool) -> SignInPage {
        let buttonEndPoint = scrollView.frame.minY + stackView.frame.height
        let keyboardEndPoint = app.keyboards.element(boundBy: 0).frame.minY
        let expectation = buttonEndPoint > keyboardEndPoint
        expect(expectation).toEventually(equal(value))
        return self
    }

    @discardableResult
    func verifyTextFieldEditing(to value: Bool) -> SignInPage {
        expect(self.loginTextField.hasFocus).to(equal(value))
        return self
    }

    @discardableResult
    func verifyTextFieldEnable(to value: Bool) -> SignInPage {
        expect(self.loginTextField.isEnabled).to(equal(value))
        return self
    }

    @discardableResult
    func verifyKeyboard(to value: Bool) -> SignInPage {
        expect(self.app.keyboards.count > 0).toEventually(equal(value))
        return self
    }

    @discardableResult
    func verifyContinueButtonWidth() -> SignInPage {
        let expectaiton = continueButton.frame.width <=
            Constants.UI.SignInButton.width.rawValue
        expect(expectaiton).to(equal(true))
        return self
    }

    @discardableResult
    func verifyLoginTextFieldWidth() -> SignInPage {
        let expectation = loginTextField.frame.width <=
            Constants.UI.MailTextField.width.rawValue
        expect(expectation).to(equal(true))
        return self
    }

    @discardableResult
    func verifyIndicatorExistance(to value: Bool) -> SignInPage {
        expect(self.activityIndicator.exists)
            .toEventually(equal(value), timeout: DispatchTimeInterval.seconds(5))
        return self
    }

    // MARK: - Actions

    @discardableResult
    func typeLogin(_ login: String) -> SignInPage {
        loginTextField.typeText(login)
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
    func tapLoginTextField() -> SignInPage {
        loginTextField.tap()
        return self
    }
}
