//
//  Appearance+Light.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - Light

struct Light {

    // MARK: - Properties

    private let accent: UIColor
    private let plainTextColor = UIColor(hexString: "#000000")
    private let backgroundColor = UIColor(hexString: "#f2f2f7")

    // MARK: - Initializers

    init(accent: UIColor) {
        self.accent = accent
    }
}

// MARK: - Appearance

extension Light: Appearance {

    var type: AppearanceType {
        .light
    }

    var color: UIColor {
        backgroundColor
    }

    var searchBarStyle: UIBarStyle {
        .default
    }

    var activityIndicatorStyle: UIColor {
        .lightGray
    }

    var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }

    @available(iOS 13.0, *)
    var userInterfaceStyle: UIUserInterfaceStyle {
        .light
    }

    func presentedBackground(forLevel level: Int) -> UIColor {
        backgroundColor
    }

    var alertControllerAppearance: AlertControllerAppearance {
        AlertControllerAppearance(
            imageColor: .init(hexString: "#8F8F8A"),
            titleFont: .SFProSemibold(ofSize: 17),
            titleColor: .black,
            descriptionFont: .SFProRegular(ofSize: 13),
            descriptionColor: .black,
            actionButtonBackgroundColor: accent,
            actionButtonTitleFont: .SFProBold(ofSize: 17),
            actionButtonTitleColor: .white,
            backgroundColor: UIColor(hexString: "#8A8A8F").withAlphaComponent(0.53),
            backgroundBlurColor: UIColor.white.withAlphaComponent(0.62)
        )
    }

    var signInViewControllerAppearance: SignInViewControllerAppearance {
        SignInViewControllerAppearance(
            backgroundColor: backgroundColor,
            loginTextFieldTextColor: .black,
            loginTextFieldBackgroundColor: .lightGray,
            welcomeLabelTextColor: .black,
            welcomeLabelFont: .SFProBold(ofSize: 34),
            signInButtonColorEnabled: accent,
            signInButtonColorDisabled: accent,
            signInButtonTitleColor: .white,
            signInButtonTitleFont: .SFProBold(ofSize: 17)
        )
    }

    var hudAppearance: CMHUDAppearance {
        CMHUDAppearance(
            backgroundColor: UIColor(hexString: "#8A8A8F").withAlphaComponent(0.38),
            centralViewBackgroundColor: UIColor(red: 138, green: 138, blue: 143).withAlphaComponent(0.62),
            centralViewContentColor: .white
        )
    }
}
