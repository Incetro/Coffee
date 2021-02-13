//
//  AccessibilityHierarchy.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - AccessibilityHierarchy

enum AccessibilityHierarchy {

    // MARK: - SignIn

    enum SignIn: String, UIElement, RawRepresentable {
        case mailTextField = "sign-in.mail-text-field"
        case continueButton = "sign-in.continue-button"
        case welcomeLabel = "sign-in.welcome-label"
        case headerImageView = "sign-in.header-image-view"
    }
}
