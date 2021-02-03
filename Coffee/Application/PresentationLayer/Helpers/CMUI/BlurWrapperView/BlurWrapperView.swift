//
//  BlurWrapperView.swift
//  Coffee
//
//  Created by incetro on 10/02/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - BlurWrapperView

public final class BlurWrapperView<T: UIView>: UIView {

    // MARK: - CornerRadiusType

    public enum CornerRadiusType {
        case some(CGFloat)
        case full
    }

    // MARK: - Properties

    /// Content view
    public let targetView: T

    /// Corner radius type
    public var cornerRadius: CornerRadiusType = .full {
        didSet {
            updateCornerRadius()
        }
    }

    /// Background blur color
    public var blurBackgroundColor: UIColor? {
        didSet {
            blurBackgroundView.subviews[1].backgroundColor = blurBackgroundColor
        }
    }

    /// Current visual effect view
    private let blurBackgroundView: UIVisualEffectView = {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blur.isUserInteractionEnabled = false
        blur.subviews[1].backgroundColor = UIColor.black.withAlphaComponent(0.93)
        return blur
    }()

    /// Content insets
    private let targetViewInset: UIEdgeInsets

    // MARK: - Initializers

    public init(targetView: T, targetViewInset inset: UIEdgeInsets = .zero) {
        self.targetView = targetView
        self.targetViewInset = inset
        super.init(frame: .zero)
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIView

    override public func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }

    // MARK: - Private

    private func setup() {
        addSubview(blurBackgroundView)
        blurBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        blurBackgroundView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        blurBackgroundView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        blurBackgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        addSubview(targetView)
        targetView.translatesAutoresizingMaskIntoConstraints = false
        targetView.leftAnchor.constraint(equalTo: leftAnchor, constant: targetViewInset.left).isActive = true
        targetView.rightAnchor.constraint(equalTo: rightAnchor, constant: -targetViewInset.right).isActive = true
        targetView.topAnchor.constraint(equalTo: topAnchor, constant: targetViewInset.top).isActive = true
        targetView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -targetViewInset.bottom).isActive = true
    }

    private func updateCornerRadius() {
        switch cornerRadius {
        case .full:
            smoothlyRoundCourners(radius: min(frame.height, frame.width) / 2)
        case .some(let radius):
            smoothlyRoundCourners(radius: radius)
        }
    }
}
