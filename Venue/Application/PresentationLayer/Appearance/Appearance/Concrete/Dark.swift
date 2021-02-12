//
//  Dark.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - Dark

struct Dark {

    // MARK: - Properties

    private let accent: UIColor
    private let plainTextColor = UIColor.white
    private let backgroundColor = UIColor.black
    private let workpieceColor = UIColor(hexString: "#1C1C1D")

    // MARK: - Initializers

    init(accent: UIColor) {
        self.accent = accent
    }
}

// MARK: - Appearance

extension Dark: Appearance {

    var type: AppearanceType {
        .dark
    }

    var color: UIColor {
        backgroundColor
    }

    var searchBarStyle: UIBarStyle {
        .black
    }

    var activityIndicatorStyle: UIColor {
        .white
    }

    var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    @available(iOS 13.0, *)
    var userInterfaceStyle: UIUserInterfaceStyle {
        .dark
    }

    func presentedBackground(forLevel level: Int) -> UIColor {
        switch level {
        case 0:
            return .black
        case 1:
            return UIColor(hexString: "#1C1C1D")
        case 2:
            return UIColor(hexString: "#2C2C2D")
        case 3:
            return UIColor(hexString: "#3A3A3B")
        default:
            fatalError("Unsupported level")
        }
    }

    var signInViewControllerAppearance: SignInViewControllerAppearance {
        SignInViewControllerAppearance(
            backgroundColor: backgroundColor,
            loginTextFieldTextColor: .white,
            loginTextFieldBackgroundColor: workpieceColor,
            welcomeLabelTextColor: .white,
            welcomeLabelFont: .SFProBold(ofSize: 34),
            signInButtonColorEnabled: accent,
            signInButtonColorDisabled: accent,
            signInButtonTitleColor: .black,
            signInButtonTitleFont: .SFProBold(ofSize: 17)
        )
    }

    var hudAppearance: CMHUDAppearance {
        CMHUDAppearance(
            backgroundColor: UIColor(red: 66, green: 66, blue: 67).withAlphaComponent(0.38),
            centralViewBackgroundColor: UIColor(red: 138, green: 138, blue: 143).withAlphaComponent(0.62),
            centralViewContentColor: .white
        )
    }
}
