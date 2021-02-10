//
//  Language.swift
//  Venue
//
//  Created by incetro on 29/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - Language

enum Language: String, CaseIterable {

    case russian = "ru"
    case english = "en"

    var localizedPath: String {
        Bundle.main.path(forResource: rawValue, ofType: "lproj").unwrap()
    }

    var locale: Locale {
        Locale(identifier: rawValue)
    }

    var title: String {
        switch self {
        case .russian:
            return L10n.Languages.Russian.title
        case .english:
            return L10n.Languages.English.title
        }
    }

    var name: String {
        switch self {
        case .russian:
            return L10n.Languages.Russian.name
        case .english:
            return L10n.Languages.English.name
        }
    }
}
