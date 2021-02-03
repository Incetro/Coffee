//
//  UIApplicationOpenURLProtocol.swift
//  Coffee Prod
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2017 Coffee. All rights reserved.
//

import UIKit

// MARK: - UIApplicationOpenURLProtocol

protocol UIApplicationOpenURLProtocol {

    /// Returns true if can open the given url
    ///
    /// - Parameter url: checkable url
    /// - Returns: true if can open the given url
    func canOpenURL(_ url: URL) -> Bool

    /// Opens the given URL
    ///
    /// - Parameter url: the given URL
    /// - Returns: true if can open the given url
    func openURL(_ url: URL) -> Bool
}

// MARK: - UIApplication

extension UIApplication: UIApplicationOpenURLProtocol {
}
