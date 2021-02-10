//
//  Localizer.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 incetro. All rights reserved.
//

import Foundation

// MARK: - Localizer

protocol Localizer {

    /// Current app language
    var currentLanguage: Language { get }

    /// Set current language
    ///
    /// - Parameter language: new language
    func setCurrrentLanguage(_ language: Language)

    /// Add localizable instance (observer)
    ///
    /// - Parameter localizable: some localization observer
    func add(localizable: Localizable)
}
