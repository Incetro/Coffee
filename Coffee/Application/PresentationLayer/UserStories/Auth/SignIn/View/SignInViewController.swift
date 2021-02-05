//
//  SignInViewController.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit
import Foundation
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

    /// Auxiliary scrollView instance (for using with stackView tricks)
    private let scrollView = UIScrollView().then {
        $0.clipsToBounds = false
        $0.showsVerticalScrollIndicator = false
        $0.delaysContentTouches = false
    }

    /// Auxiliary stackView instance
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
    }

    /// Presenter instance
    var output: SignInViewOutput?

    /// Scroll view top constraint
    private var topConstraint: NSLayoutConstraint?

    /// Keyboard events helper
    private let keyboardObserver: KeyboardObserver

    // MARK: - Initializers

    init(keyboardObserver: KeyboardObserver) {
        self.keyboardObserver = keyboardObserver
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        keyboardObserver.unregister(observer: self)
    }

    // MARK: - ViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        localizer.add(localizable: self)
        designer.add(designable: self)
        output?.didTriggerViewReadyEvent()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        keyboardObserver.register(observer: self)
//        loginTextField.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardObserver.unregister(observer: self)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.smoothlyRoundCourners(radius: LayoutConstants.signInButtonHeight / 2)
    }

    // MARK: - Private

    private func signInButton(enabled: Bool) {
        signInButton.isEnabled = enabled
        UIView.animate(withDuration: 0.3) {
            self.signInButton.alpha = enabled ? 1 : 0.5
        }
    }
}

// MARK: - Layout

extension SignInViewController {

    private func setupScrollView() {
        let inset = LayoutConstants.contentInsets.left
        view.addSubview(scrollView)
        let topOfScroll = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topOfScroll,
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: inset),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -inset)
        ])
        topConstraint = topOfScroll
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
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
        NSLayoutConstraint.activate([
            signInButton.heightAnchor.constraint(equalToConstant: LayoutConstants.signInButtonHeight)
        ])
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
        setupScrollView()
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

// MARK: - KeyboardObservable

extension SignInViewController: KeyboardObservable {

    func keyboardWillShow(keyboardInfo: KeyboardInfo) {
        var stackFrame = stackView.frame
        stackFrame.origin.y += 64
        let intersection = stackFrame.intersection(keyboardInfo.frameEnd)
        guard intersection.height > 0 else { return }
        blurredNavigationController?.visualEffectView.alpha = 0
        topConstraint?.constant = -intersection.height - 80
        UIView.animate(withDuration: keyboardInfo.animationDuration) {
            self.view.layoutIfNeeded()
        }
    }

    func keyboardWillHide(keyboardInfo: KeyboardInfo) {
        topConstraint?.constant = 0
        blurredNavigationController?.visualEffectView.alpha = 1
        UIView.animate(withDuration: keyboardInfo.animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - LayoutConstants

private enum LayoutConstants {
    static let loginTextFieldHeight: CGFloat = 50
    static let loginTextFieldLeftSpacing: CGFloat = 16
    static let loginTextFieldRightSpacing: CGFloat = 16
    static let signInButtonHeight: CGFloat = 50
    static let welcomeLabelHeight: CGFloat = 300

    static let contentInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)

    static var welcomLabelSpacing: CGFloat {
        32
    }

    static var loginTextFieldSpacing: CGFloat {
        16
    }
}
