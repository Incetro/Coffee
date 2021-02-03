//
//  LocalizerImplementation.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 incetro. All rights reserved.
//

import Foundation

// MARK: - LocalizerImplementation

final class LocalizerImplementation {

    typealias LocalizeBlock = (Localizable) -> Void

    // MARK: - Properties

    /// UserDefaults instance
    private let defaults: UserDefaults

    /// Current observers
    private var observers = ObserverList<LocalizeBlock>()

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter defaults: UserDefaults instance
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
}

// MARK: - Localizer

extension LocalizerImplementation: Localizer {

    var currentLanguage: Language {
        if let string = defaults.string(forKey: Constants.UserDefaultsKeys.language.rawValue) {
            if let language = Language(rawValue: string) {
                return language
            }
        } else if let locale = NSLocale.current.languageCode, let language = Language(rawValue: locale) {
            return language
        }
        return .russian
    }

    func setCurrrentLanguage(_ language: Language) {
        L10n.bundle = Bundle(path: language.localizedPath)
        defaults.set(language.rawValue, forKey: Constants.UserDefaultsKeys.language.rawValue)
        observers.forEach { object, block in
            if let localizable = object as? Localizable {
                block(localizable)
            }
        }
    }

    func add(localizable: Localizable) {
        observers.addObserver(disposable: localizable) { [weak self] localizable in
            guard let `self` = self else {
                return
            }
            localizable.localize(language: self.currentLanguage)
        }
        localizable.localize(language: currentLanguage)
    }
}
