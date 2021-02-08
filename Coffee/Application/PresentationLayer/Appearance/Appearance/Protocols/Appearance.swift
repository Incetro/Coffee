//
//  Appearance.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - AppearanceType

enum AppearanceType: Int, Codable, CaseIterable {

    case light
    case dark
}

// MARK: - Appearance

protocol Appearance {

    /// Current appearance type
    var type: AppearanceType { get }

    /// Main appearance color
    var color: UIColor { get }

    /// Search bar style
    var searchBarStyle: UIBarStyle { get }

    /// Activity indicators style
    var activityIndicatorStyle: UIColor { get }

    /// Returns preferred status bar style for all screens
    var preferredStatusBarStyle: UIStatusBarStyle { get }

    /// Current app interface style
    @available(iOS 13.0, *)
    var userInterfaceStyle: UIUserInterfaceStyle { get }

    /// Return background for controller if the controller
    /// has some presented view controller
    /// - Parameter level: presenting level
    func presentedBackground(forLevel level: Int) -> UIColor

    /// CMHUDAppearance instance
    var hudAppearance: CMHUDAppearance { get }

    /// AlertControllerAppearance instance
    var alertControllerAppearance: AlertControllerAppearance { get }

    /// SignInViewControllerAppearance instance
    var signInViewControllerAppearance: SignInViewControllerAppearance { get }
}
