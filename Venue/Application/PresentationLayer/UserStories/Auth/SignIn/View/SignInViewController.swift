//
//  SignInViewController.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit
import Layout

// MARK: - SignInViewController

final class SignInViewController: ViewController {

    // MARK: - Properties

    /// Progress indicator
    private lazy var activityIndicator = UIActivityIndicatorView()

    /// View with current header image
    private var headerImageView = UIImageView(image: Asset.logo.image).then {
        $0.contentMode = .scaleAspectFit
    }

    /// Label with a 'welcomeLabel' text
    private let welcomeLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }

    /// Login button
    private let signInButton = UIButton().then {
        $0.isEnabled = false
    }

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

    /// True if the current username matches username regex
    private var isLoginValid: Bool {
        guard let login = loginTextField.text else {
            return false
        }
        return Constants.Regex.email.matches(login)
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
        designer.add(designable: self)
        localizer.add(localizable: self)
        output?.didTriggerViewReadyEvent()
        testify()
        hideKeyboardWhenTappedAround()
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
        loginTextField.smoothlyRoundCourners(radius: LayoutConstants.loginTextFieldHeight / 2)
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
        scrollView
            .prepareForAutolayout()
            .bottom(to: view.bottom)
            .left(to: view.left + inset)
            .right(to: view.right - inset)
        topConstraint = scrollView.top.connect(to: view.top)
    }

    private func setupStackView() {
        scrollView.addSubview(stackView.prepareForAutolayout())
        stackView
            .top(to: scrollView.top)
            .centerX(to: scrollView.centerX)
            .width.equal(to: scrollView.width)
    }

    private func setupLogoImage() {
        headerImageView.height(LayoutConstants.headerImageViewHeight)
        stackView.addArrangedSubview(headerImageView.prepareForAutolayout())
        stackView.setCustomSpacing(LayoutConstants.logoImageViewSpacing, after: headerImageView)
    }

    private func setupLabels() {
        stackView.addArrangedSubview(welcomeLabel.prepareForAutolayout())
        stackView.setCustomSpacing(LayoutConstants.welcomLabelSpacing, after: welcomeLabel)
    }

    private func setupTextFields() {
        let loginTextFieldContainer = UIView()
            .prepareForAutolayout()
            .height(LayoutConstants.loginTextFieldHeight)
        loginTextFieldContainer.addSubview(loginTextField.prepareForAutolayout())
        loginTextField
            .height(equalTo: loginTextFieldContainer.height)
            .width(LayoutConstants.loginTextFieldWidth)
            .centerX(to: loginTextFieldContainer.centerX)
        loginTextField.right.less(than: loginTextFieldContainer.right)
        loginTextField.left.greater(than: loginTextFieldContainer.left)
        stackView.addArrangedSubview(loginTextFieldContainer)
        stackView.setCustomSpacing(LayoutConstants.loginTextFieldSpacing, after: loginTextFieldContainer)
        loginTextField.addTarget(self, action: #selector(didEndEditingLoginTextField), for: .primaryActionTriggered)
        loginTextField.addTarget(self, action: #selector(didStartEditingLoginTextField), for: .editingChanged)
    }

    private func setupSignInButton() {
        let signInButtonContainer = UIView()
            .prepareForAutolayout()
            .height(LayoutConstants.signInButtonHeight)
        signInButtonContainer.addSubview(signInButton.prepareForAutolayout())
        signInButton
            .height(equalTo: signInButtonContainer.height)
            .width(LayoutConstants.signInButtonWidth)
            .centerX(to: signInButtonContainer.centerX)
        signInButton.right.less(than: signInButtonContainer.right)
        signInButton.left.greater(than: signInButtonContainer.left)
        stackView.addArrangedSubview(signInButtonContainer)
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didEndEditingLoginTextField), for: .touchUpInside)
        signInButton(enabled: false)
    }
}

// MARK: - Actions

extension SignInViewController {

    @objc private func didTapSignInButton() {
        guard !activityIndicator.isAnimating else { return }
        guard let login = loginTextField.text else { return }
        output?.didTapSignInButton(login: login)
    }

    @objc private func didEndEditingLoginTextField() {
        loginTextField.resignFirstResponder()
    }

    @objc private func didStartEditingLoginTextField() {
        signInButton(enabled: isLoginValid)
    }
}

// MARK: - SignInViewInput

extension SignInViewController: SignInViewInput {

    func setupInitialState() {
        setupScrollView()
        setupStackView()
        setupLogoImage()
        setupLabels()
        setupTextFields()
        setupSignInButton()
    }

    func startIndication() {
        signInButton.isEnabled = false
        loginTextField.rightViewMode = .always
        activityIndicator.startAnimating()
        testify(activityIndicator, using: .activityIndicator)
    }

    func stopIndication() {
        signInButton.isEnabled = true
        loginTextField.rightViewMode = .never
        activityIndicator.stopAnimating()
    }
}

// MARK: - UITextFieldDelegate

extension SignInViewController: UITextFieldDelegate {

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
        let design = appearance.signInViewControllerAppearance
        view.backgroundColor = design.backgroundColor
        activityIndicator.tintColor = appearance.activityIndicatorStyle
        welcomeLabel.textColor = design.welcomeLabelTextColor
        welcomeLabel.font = design.welcomeLabelFont
        loginTextField.backgroundColor = design.loginTextFieldBackgroundColor
        loginTextField.tintColor = design.signInButtonColorEnabled
        loginTextField.textColor = design.loginTextFieldTextColor
        signInButton.backgroundColor = design.signInButtonColorEnabled
        signInButton.setTitleColor(design.signInButtonTitleColor, for: .normal)
        signInButton.titleLabel?.font = design.signInButtonTitleFont
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
        topConstraint?.constant = 0
        blurredNavigationController?.visualEffectView.alpha = 1
        UIView.animate(withDuration: keyboardInfo.animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - UIPage

extension SignInViewController: UIPage {
    typealias UIElementType = AccessibilityHierarchy.SignIn
}

// MARK: - Testify

extension SignInViewController {

    /// Mark all alements as testable views
    func testify() {
        testify(welcomeLabel, using: .welcomeLabel)
        testify(loginTextField, using: .mailTextField)
        testify(headerImageView, using: .headerImageView)
        testify(signInButton, using: .signInButton)
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
    static let headerImageViewHeight: CGFloat = 70
    static let contentInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)

    static var welcomLabelSpacing: CGFloat {
        32
    }

    static var logoImageViewSpacing: CGFloat {
        16
    }

    static var loginTextFieldSpacing: CGFloat {
        16
    }
}
