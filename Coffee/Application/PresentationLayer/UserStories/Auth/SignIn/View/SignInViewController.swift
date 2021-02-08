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

    /// Auxiliary gesture recognizer for keyboard
    private var keyboardDismissTapGuesture: UIGestureRecognizer?

    /// Phone text field
    private lazy var loginTextField = UITextField().then {
        $0.keyboardType = .emailAddress
        $0.delegate = self
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
        loginTextField.becomeFirstResponder()
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
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(view)
        stackView.setCustomSpacing(LayoutConstants.loginTextFieldSpacing, after: view)
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: LayoutConstants.loginTextFieldHeight)
        ])
        view.addSubview(loginTextField)
        NSLayoutConstraint.activate([
            loginTextField.widthAnchor.constraint(equalToConstant: LayoutConstants.loginTextFieldWidth),
            loginTextField.heightAnchor.constraint(equalTo: view.heightAnchor),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            loginTextField.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor)
        ])
        loginTextField.addTarget(self, action: #selector(didEndEditingLoginTextField), for: .primaryActionTriggered)
    }

    private func setupSignInButton() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(view)
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: LayoutConstants.signInButtonHeight)
        ])
        view.addSubview(signInButton)
        NSLayoutConstraint.activate([
            signInButton.widthAnchor.constraint(equalToConstant: LayoutConstants.signInButtonWidth),
            signInButton.heightAnchor.constraint(equalTo: view.heightAnchor),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            signInButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor)
        ])
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didEndEditingLoginTextField), for: .touchUpInside)
        signInButton(enabled: false)
    }

    @objc private func didTapSignInButton() {
        guard !activityIndicator.isAnimating else { return }
        guard let mail = loginTextField.text else { return }
        output?.didTapSignInButton(mail: mail)
    }

    @objc private func didEndEditingLoginTextField() {
        loginTextField.resignFirstResponder()
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

// MARK: - UITextFieldDelegate

extension SignInViewController: UITextFieldDelegate {

    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var count = (textField.text?.count ?? 0) + 1
        if string == "" {
            count -= 2
        }
        let complete = count > 4
        signInButton(enabled: complete)
        return true
    }

    internal func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard !activityIndicator.isAnimating else { return false }
        return true
    }
}

// MARK: - ViperViewOutputProvider

extension SignInViewController: ViewOutputProvider {
    var viewOutput: ModuleInput? {
        output as? ModuleInput
    }
}

// MARK: - Designable

extension SignInViewController: Designable {

    func design(appearance: Appearance) {
        view.backgroundColor = .white
        activityIndicator.tintColor = appearance.activityIndicatorStyle
        welcomeLabel.textColor = .black
        welcomeLabel.font = .systemFont(ofSize: 25, weight: .bold)
        loginTextField.backgroundColor = .lightGray
        loginTextField.tintColor = .blue
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
        if keyboardDismissTapGuesture == nil {
            keyboardDismissTapGuesture = UITapGestureRecognizer(target: self, action: #selector(didEndEditingLoginTextField))
            keyboardDismissTapGuesture?.cancelsTouchesInView = false
        }
        if let keyboardDismissTapGuesture = keyboardDismissTapGuesture {
            view.addGestureRecognizer(keyboardDismissTapGuesture)
        }
        var stackFrame = stackView.frame
        stackFrame.origin.y += 75
        let intersection = stackFrame.intersection(keyboardInfo.frameEnd)
        guard intersection.height > 0 else { return }
        blurredNavigationController?.visualEffectView.alpha = 0
        topConstraint?.constant = -intersection.height - 70
        UIView.animate(withDuration: keyboardInfo.animationDuration) {
            self.view.layoutIfNeeded()
        }
    }

    func keyboardWillHide(keyboardInfo: KeyboardInfo) {
        if let keyboardDismissTapGuesture = keyboardDismissTapGuesture {
            view.removeGestureRecognizer(keyboardDismissTapGuesture)
            self.keyboardDismissTapGuesture = nil
        }
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
    static let loginTextFieldWidth: CGFloat = 370
    static let signInButtonHeight: CGFloat = 50
    static let signInButtonWidth: CGFloat = 370
    static let welcomeLabelHeight: CGFloat = 200

    static let contentInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)

    static var welcomLabelSpacing: CGFloat {
        32
    }

    static var loginTextFieldSpacing: CGFloat {
        16
    }
}
