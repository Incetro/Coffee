//
//  Launcher.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - Launcher

/// Interface for all application's launchers
/// (launcher is an object which process all unusual application's launches)
protocol Launcher {

    /// Checks if current launcher can process the given user action
    ///
    /// - Parameter activity: Given user action
    /// - Returns: true, if launcher can process the given activity
    func canLaunch(withActivity activity: NSUserActivity) -> Bool

    /// Process the given user actitity
    ///
    /// - Parameter activity: Given user action
    func launch(withActivity activity: NSUserActivity)
}
