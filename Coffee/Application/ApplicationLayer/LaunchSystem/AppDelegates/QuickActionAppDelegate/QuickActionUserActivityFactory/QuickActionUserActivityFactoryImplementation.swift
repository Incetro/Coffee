//
//  QuickActionUserActivityFactoryImplementation.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - QuickActionUserActivityFactoryImplementation

final class QuickActionUserActivityFactoryImplementation {
}

// MARK: - QuickActionUserActivityFactory

extension QuickActionUserActivityFactoryImplementation: QuickActionUserActivityFactory {

    func userActivity(fromShortcutItem shortcutItem: UIApplicationShortcutItem) -> NSUserActivity {
        let activity = NSUserActivity(activityType: shortcutItem.type)
        activity.userInfo = shortcutItem.userInfo
        return activity
    }
}
