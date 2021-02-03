//
//  SignInViewController.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit
import InputMask

// MARK: - SignInViewController

final class SignInViewController: ViewController {

    // MARK: - Properties

    /// Progress indicator
    private lazy var activityIndicator = UIActivityIndicatorView()

    /// MaskedTextFieldDelegate instance
    private lazy var loginTextFieldListener = MaskedTextFieldDelegate().then {
        $0.delegate = self
    }

    /// Phone text field
    private lazy var loginTextField = UITextField().then {
        $0.keyboardType = .phonePad
        $0.delegate = loginTextFieldListener
    }

    /// Label with a 'welcomeLabel' text
    private let welcomeLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }

    /// Login button
    private let signInButton = UIButton(type: .roundedRect).then {
        $0.isEnabled = false
    }

    /// Auxiliary stackView instance
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
    }

    /// Presenter instance
    var output: SignInViewOutput?

    // MARK: - ViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loginTextField.becomeFirstResponder()
    }

    // MARK: - Private

    private func signInButton(enabled: Bool) {
        signInButton.isEnabled = enabled
        UIView.animate(withDuration: 0.35) {
            self.signInButton.alpha = enabled ? 1 : 0.62
        }
    }
}

// MARK: - Layout

extension SignInViewController {

    private func setupStackView() {
        let inset = LayoutConstants.contentInsets.left
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: inset),
            stackView.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -inset)
        ])
    }

    private func setupLabels() {
        stackView.addArrangedSubview(welcomeLabel)
        stackView.setCustomSpacing(LayoutConstants.welcomLabelSpacing, after: welcomeLabel)
    }

    private func setupTextFields() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(loginTextField)
        stackView.setCustomSpacing(LayoutConstants.loginTextFieldSpacing, after: loginTextField)
        NSLayoutConstraint.activate([
            loginTextField.heightAnchor.constraint(equalToConstant: LayoutConstants.loginTextFieldHeight)
        ])

    }

    private func setupSignInButton() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(signInButton)
        NSLayoutConstraint.activate([
            signInButton.heightAnchor.constraint(equalToConstant: LayoutConstants.signInButtondHeight)
        ])
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    }

    @objc private func didTapSignInButton() {
        guard !activityIndicator.isAnimating else { return }
        guard let phone = loginTextField.text else { return }
        output?.didTapSignInButton(phone: phone)
    }
}

// MARK: - SignInViewInput

extension SignInViewController: SignInViewInput {

    func setupInitialState() {
        setupStackView()
        setupLabels()
        setupTextFields()
        setupSignInButton()
    }

    func startIndication() {
        signInButton.isEnabled = false
        loginTextField.rightViewMode = .always
        activityIndicator.startAnimating()
    }

    func stopIndication() {
        signInButton.isEnabled = true
        loginTextField.rightViewMode = .never
        activityIndicator.stopAnimating()
    }
}

// MARK: - ViperViewOutputProvider

extension SignInViewController: ViewOutputProvider {
    var viewOutput: ModuleInput? {
        output as? ModuleInput
    }
}

// MARK: - MaskedTextFieldDelegateListener

extension SignInViewController: MaskedTextFieldDelegateListener {

    func textField(
        _ textField: UITextField,
        didFillMandatoryCharacters complete: Bool,
        didExtractValue value: String
    ) {
        let complete = complete && textField.text?.isEmpty == false
        signInButton(enabled: complete)
    }
}

// MARK: - Localizable

extension SignInViewController: Localizable {

    func localize(language: Language) {
        welcomeLabel.text = L10n.SignIn.welcomeTitle
        loginTextField.placeholder = L10n.SignIn.Placeholders.login
        signInButton.setTitle(L10n.SignIn.signInButton, for: .normal)
    }
}

// MARK: - LayoutConstants

private enum LayoutConstants {
    static let loginTextFieldHeight: CGFloat = 50
    static let loginTextFieldLeftSpacing: CGFloat = 16
    static let loginTextFieldRightSpacing: CGFloat = 16
    static let signInButtondHeight: CGFloat = 50

    static let contentInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)

    static var welcomLabelSpacing: CGFloat {
        49
    }

    static var loginTextFieldSpacing: CGFloat {
        16
    }
}
