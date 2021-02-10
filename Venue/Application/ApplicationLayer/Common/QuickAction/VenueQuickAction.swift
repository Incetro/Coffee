//
//  VenueQuickAction.swift
//  Venue
//
//  Created by incetro on 30/01/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - VenueQuickAction

enum VenueQuickAction: String, QuickActionType {

    case create

    var value: String {
        String(describing: self)
    }
}
