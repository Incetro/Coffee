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
        $0.customNotations = [
            Notation(
                character: "D",
                characterSet: CharacterSet(charactersIn: "."),
                isOptional: false
            ),
            Notation(
                character: "d",
                characterSet: CharacterSet(charactersIn: "."),
                isOptional: true
            ),
            Notation(
                character: "@",
                characterSet: CharacterSet(charactersIn: "@"),
                isOptional: false
            )
        ]
        $0.affineFormats = ["[aaaaaaaaaa][d][aaaaaaaaaa][@][aaaaaaaaaa][d][aaaaaaaaaa][D][aaaaaaaaaa]"]
    }

    /// Phone text field
    private lazy var loginTextField = UITextField().then {
        $0.keyboardType = .emailAddress
        $0.delegate = loginTextFieldListener
        $0.addLeftSpacing(LayoutConstants.loginTextFieldLeftSpacing)
        let activityIndicatorWrapper = UIView(
            frame: .init(
                x: 0, y: 0,
                width: LayoutConstants.loginTextFieldRightSpacing * 3 + activityIndicator.frame.width,
                height: LayoutConstants.loginTextFieldHeight
            )
        )
        activityIndicatorWrapper.addSubview(activityIndicator)
        activityIndicator.center = .init(
            x: activityIndicatorWrapper.frame.width / 2,
            y: activityIndicatorWrapper.frame.height / 2
        )
        $0.rightView = activityIndicatorWrapper
        $0.rightViewMode = .never
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
        localizer.add(localizable: self)
        designer.add(designable: self)
        output?.didTriggerViewReadyEvent()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loginTextField.becomeFirstResponder()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.smoothlyRoundCourners(radius: LayoutConstants.signInButtonHeight / 2)
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
        let heightOfStack = LayoutConstants.welcomeLabelHeight + LayoutConstants.loginTextFieldHeight + LayoutConstants.signInButtonHeight
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: inset * 4),
            stackView.heightAnchor.constraint(equalToConstant: heightOfStack + inset * 2),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: inset),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -inset)
        ])
    }

    private func setupLabels() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(welcomeLabel)
        stackView.setCustomSpacing(LayoutConstants.welcomLabelSpacing, after: welcomeLabel)
        NSLayoutConstraint.activate([
            welcomeLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.welcomeLabelHeight)
        ])
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
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    }

    @objc private func didTapSignInButton() {
        guard !activityIndicator.isAnimating else { return }
        guard let mail = loginTextField.text else { return }
        output?.didTapSignInButton(mail: mail)
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

// MARK: - Designable

extension SignInViewController: Designable {

    func design(appearance: Appearance) {
        view.backgroundColor = .white
        activityIndicator.tintColor = appearance.activityIndicatorStyle
        welcomeLabel.textColor = .black
        loginTextField.backgroundColor = .lightGray
        loginTextField.textColor = .black
        signInButton.backgroundColor = .blue
        signInButton.setTitleColor(.white, for: .normal)
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
    static let signInButtonHeight: CGFloat = 50
    static let welcomeLabelHeight: CGFloat = 50

    static let contentInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)

    static var welcomLabelSpacing: CGFloat {
        32
    }

    static var loginTextFieldSpacing: CGFloat {
        16
    }
}
