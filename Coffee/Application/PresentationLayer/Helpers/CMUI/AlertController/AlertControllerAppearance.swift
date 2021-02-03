//
//  AlertControllerAppearance.swift
//  CMUI
//
//  Created by incetro on 18/02/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - AlertControllerAppearance

public struct AlertControllerAppearance {

    // MARK: - Properties

    let imageColor: UIColor
    let titleFont: UIFont
    let titleColor: UIColor
    let descriptionFont: UIFont
    let descriptionColor: UIColor
    let actionButtonBackgroundColor: UIColor
    let actionButtonTitleFont: UIFont
    let actionButtonTitleColor: UIColor
    let backgroundColor: UIColor
    let backgroundBlurColor: UIColor

    // MARK: - Initializers

    public init(
        imageColor: UIColor,
        titleFont: UIFont,
        titleColor: UIColor,
        descriptionFont: UIFont,
        descriptionColor: UIColor,
        actionButtonBackgroundColor: UIColor,
        actionButtonTitleFont: UIFont,
        actionButtonTitleColor: UIColor,
        backgroundColor: UIColor,
        backgroundBlurColor: UIColor
    ) {
        self.imageColor = imageColor
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.descriptionFont = descriptionFont
        self.descriptionColor = descriptionColor
        self.actionButtonTitleColor = actionButtonTitleColor
        self.actionButtonTitleFont = actionButtonTitleFont
        self.actionButtonBackgroundColor = actionButtonBackgroundColor
        self.backgroundColor = backgroundColor
        self.backgroundBlurColor = backgroundBlurColor
    }
}
