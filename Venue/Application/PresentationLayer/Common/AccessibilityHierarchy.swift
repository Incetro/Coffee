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
        case loginTextField = "sign-in.login-text-field"
        case signInButton = "sign-in.continue-button"
        case welcomeLabel = "sign-in.welcome-label"
        case headerImageView = "sign-in.header-image-view"
        case activityIndicator = "sign-in.activity-indicator"
        case stackView = "sign-in.stack-view"
        case scrollView = "sign-in.scroll-view"
    }
}
