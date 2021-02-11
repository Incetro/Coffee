//
//  AccessibilityHierarchy.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - AccessibilityHierarchy

struct AccessibilityHierarchy {
    enum SignIn: String, UIElement, RawRepresentable {
        case mailTextField = "E-mail adress"
        case continueButton = "Continue"
        case welcomeLabel = "Welcome to\nVenue!"
        case imageView = "logo"
    }
}
