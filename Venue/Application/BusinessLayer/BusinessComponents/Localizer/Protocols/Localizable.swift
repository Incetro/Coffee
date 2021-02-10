//
//  Localizable.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - Localizable

protocol Localizable: class {

    /// Parent localizer instance
    var localizer: Localizer { get }

    /// Localize object with the given language
    ///
    /// - Parameter language: current selected language
    func localize(language: Language)
}

extension Localizable {

    var localizer: Localizer {
        AssembliesHolder.container.resolve(Localizer.self).unwrap()
    }

    func localize() {
        localize(language: localizer.currentLanguage)
    }
}
