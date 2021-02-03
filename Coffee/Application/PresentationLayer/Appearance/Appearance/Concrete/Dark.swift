//
//  Dark.swift
//  Coffee
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

    var alertControllerAppearance: AlertControllerAppearance {
        AlertControllerAppearance(
            imageColor: .init(hexString: "#8F8F8A"),
            titleFont: .SFProSemibold(ofSize: 17),
            titleColor: .white,
            descriptionFont: .SFProRegular(ofSize: 13),
            descriptionColor: .white,
            actionButtonBackgroundColor: accent,
            actionButtonTitleFont: .SFProBold(ofSize: 17),
            actionButtonTitleColor: .white,
            backgroundColor: UIColor.black.withAlphaComponent(0.53),
            backgroundBlurColor: UIColor(red: 28, green: 28, blue: 29).withAlphaComponent(0.62)
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
