//
//  AlertController.swift
//  CMUI
//
//  Created by incetro on 17/02/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - AlertController

public final class AlertController: UIViewController {

    // MARK: - Properties

    private let actionsStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fillEqually
    }

    /// View which stores all content in the current alert
    private let contentView = BlurWrapperView(targetView: UIStackView()).then {
        $0.targetView.axis = .vertical
        $0.targetView.alignment = .center
        $0.cornerRadius = .some(16)
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.13)
    }

    /// Header image instance
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    /// Title label instance
    private let titleLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }

    /// Description label instance
    private let descriptionLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }

    /// Desirable action button instance
    private let desirableActionButton = AdaptiveWidthButton(minWidth: 90, sideInset: 16)

    /// Desirable action button instance
    private let cancelActionButton = AdaptiveWidthButton(minWidth: 90, sideInset: 16)

    /// Calls before dismiss
    public var willHide: (() -> Void)?

    /// Calls after dismiss
    public var didHide: (() -> Void)?

    /// Desirable action closure
    public var desirableAction: (() -> Void)?

    /// Cancel action closure
    public var cancelAction: (() -> Void)?

    // MARK: - UIViewController

    /// Initializer for attributed strings
    /// - Parameters:
    ///   - image: alert header image
    ///   - title: alert title
    ///   - description: alert description
    ///   - actionButtonTitle: action button title
    ///   - appearance: AlertControllerAppearance instance
    public init(
        image: UIImage,
        title: NSAttributedString,
        description: NSAttributedString,
        actionButtonTitle: String,
        appearance: AlertControllerAppearance
    ) {
        self.titleLabel.attributedText = title
        self.descriptionLabel.attributedText = description
        self.imageView.image = image.withRenderingMode(.alwaysTemplate)
        self.desirableActionButton.setTitle(actionButtonTitle, for: .normal)
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
        design(appearance: appearance)
    }

    /// Initializer for standard strings
    /// - Parameters:
    ///   - image: alert header image
    ///   - title: alert title
    ///   - description: alert description
    ///   - actionButtonTitle: action button title
    ///   - appearance: AlertControllerAppearance instance
    public init(
        image: UIImage? = nil,
        title: String,
        description: String? = nil,
        actionButtonTitle: String,
        cancelButtonTitle: String? = nil,
        appearance: AlertControllerAppearance
    ) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        self.imageView.image = image?.withRenderingMode(.alwaysTemplate)
        self.desirableActionButton.setTitle(actionButtonTitle, for: .normal)
        if let cancelButtonTitle = cancelButtonTitle {
            cancelActionButton.setTitle(cancelButtonTitle, for: .normal)
        }
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
        design(appearance: appearance)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
        view.alpha = 0
        view.animate(.fadeIn(duration: 0.2))
        contentView.transform = LayoutConstants.contentViewTransform
        contentView.alpha = 0
        contentView.animate(inParallel:
                            .transform(.identity,
                                    duration: 0.3,
                                    springWithDamping: 0.5,
                                    springVelocity: 0.5,
                                    animationOptions: .curveEaseInOut),
                            .fadeIn(duration: 0.2,
                                    springWithDamping: 0.5,
                                    springVelocity: 0.5,
                                    animationOptions: .curveEaseInOut)
        )
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        desirableActionButton.layer.cornerRadius = LayoutConstants.actionButtonHeight / 2
    }

    override public func loadView() {
        super.loadView()
        let wrappingView = UIView()
        wrappingView.layer.cornerRadius = 16
        wrappingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 88).isActive = true
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentView.layer.cornerRadius = 16
        contentView.insertSubview(wrappingView, at: 0)
    }

    // MARK: - Internal

    internal func design(appearance: AlertControllerAppearance) {
        imageView.tintColor = appearance.imageColor
        titleLabel.font = appearance.titleFont
        titleLabel.textColor = appearance.titleColor
        descriptionLabel.font = appearance.descriptionFont
        descriptionLabel.textColor = appearance.descriptionColor
        desirableActionButton.backgroundColor = appearance.actionButtonBackgroundColor
        desirableActionButton.titleLabel?.font = appearance.actionButtonTitleFont
        desirableActionButton.titleLabel?.textColor = appearance.actionButtonTitleColor
        cancelActionButton.setTitleColor(appearance.actionButtonBackgroundColor, for: .normal)
        cancelActionButton.titleLabel?.font = appearance.actionButtonTitleFont
        contentView.blurBackgroundColor = appearance.backgroundBlurColor
        view.backgroundColor = appearance.backgroundColor
    }

    // MARK: - Private

    private func setup() {
        setupImageView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupActionButtons()
    }

    private func setupImageView() {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.heightAnchor.constraint(equalToConstant: LayoutConstants.contentInset.top).isActive = true
        contentView.targetView.addArrangedSubview(headerView)
        if imageView.image != nil {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: LayoutConstants.imageSize).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: LayoutConstants.imageSize).isActive = true
            contentView.targetView.addArrangedSubview(imageView)
            contentView.targetView.setCustomSpacing(LayoutConstants.imageInset, after: imageView)
        }
    }

    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.targetView.addArrangedSubview(titleLabel)
        if descriptionLabel.text?.isEmpty == false {
            contentView.targetView.setCustomSpacing(LayoutConstants.titleInset, after: titleLabel)
        } else {
            contentView.targetView.setCustomSpacing(LayoutConstants.titleInsetWithoutDescription, after: titleLabel)
        }
        titleLabel.widthAnchor.constraint(
            equalTo: contentView.widthAnchor,
            multiplier: 1,
            constant: -(LayoutConstants.contentInset.left + LayoutConstants.contentInset.right)
        ).isActive = true
    }

    private func setupDescriptionLabel() {
        guard descriptionLabel.text?.isEmpty == false else {
            return
        }
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.targetView.addArrangedSubview(descriptionLabel)
        contentView.targetView.setCustomSpacing(LayoutConstants.descriptionInset, after: descriptionLabel)
        descriptionLabel.widthAnchor.constraint(
            equalTo: contentView.widthAnchor,
            multiplier: 1,
            constant: -(LayoutConstants.contentInset.left + LayoutConstants.contentInset.right)
        ).isActive = true
    }

    private func setupActionButtons() {

        desirableActionButton.addTarget(self, action: #selector(desirableActionButtonHandler), for: .touchUpInside)
        desirableActionButton.translatesAutoresizingMaskIntoConstraints = false
        desirableActionButton.heightAnchor.constraint(equalToConstant: LayoutConstants.actionButtonHeight).isActive = true

        if cancelAction != nil {
            cancelActionButton.addTarget(self, action: #selector(cancelActionButtonHandler), for: .touchUpInside)
            cancelActionButton.translatesAutoresizingMaskIntoConstraints = false
            cancelActionButton.heightAnchor.constraint(equalToConstant: LayoutConstants.actionButtonHeight).isActive = true
            actionsStackView.addArrangedSubview(cancelActionButton)
        }
        actionsStackView.addArrangedSubview(desirableActionButton)
        contentView.targetView.addArrangedSubview(actionsStackView)
        contentView.targetView.setCustomSpacing(LayoutConstants.contentInset.bottom, after: actionsStackView)
        contentView.targetView.addArrangedSubview(UIView())
    }

    @objc private func desirableActionButtonHandler() {
        view.performAnimations(
            .fadeOut(duration: LayoutConstants.dismissAnimationDuration)
        )
        contentView.performAnimationsInParallel(
            .transform(LayoutConstants.contentViewTransform,
                       duration: LayoutConstants.dismissAnimationDuration,
                       springWithDamping: 0.5,
                       springVelocity: 0.5,
                       animationOptions: .curveEaseInOut),
            .fadeOut(duration: LayoutConstants.dismissAnimationDuration,
                     springWithDamping: 0.5,
                     springVelocity: 0.5,
                     animationOptions: .curveEaseInOut)
        ) { [weak self] in
            self?.dismiss(animated: false, completion: self?.didHide)
        }
        willHide?()
        desirableAction?()
    }

    @objc private func cancelActionButtonHandler() {
        view.performAnimations(
            .fadeOut(duration: LayoutConstants.dismissAnimationDuration)
        )
        contentView.performAnimationsInParallel(
            .transform(LayoutConstants.contentViewTransform,
                       duration: LayoutConstants.dismissAnimationDuration,
                       springWithDamping: 0.5,
                       springVelocity: 0.5,
                       animationOptions: .curveEaseInOut),
            .fadeOut(duration: LayoutConstants.dismissAnimationDuration,
                     springWithDamping: 0.5,
                     springVelocity: 0.5,
                     animationOptions: .curveEaseInOut)
        ) { [weak self] in
            self?.dismiss(animated: false) {
                self?.didHide?()
            }
        }
        willHide?()
        cancelAction?()
    }
}

// MARK: - Constants

private enum LayoutConstants {
    static let contentInset = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    static let imageSize: CGFloat = 24
    static let imageInset: CGFloat = 16
    static let titleInset: CGFloat = 2
    static let titleInsetWithoutDescription: CGFloat = 24
    static let descriptionInset: CGFloat = 24
    static let actionButtonHeight: CGFloat = 44
    static let dismissAnimationDuration: Double = 0.45
    static let contentViewTransform: CGAffineTransform = .init(scaleX: 0.87, y: 0.87)
}
