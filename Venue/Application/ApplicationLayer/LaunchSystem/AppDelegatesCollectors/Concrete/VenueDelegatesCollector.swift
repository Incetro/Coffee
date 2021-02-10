//
//  VenueDelegatesCollector.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - VenueDelegatesCollector

final class VenueDelegatesCollector {
}

// MARK: - AppDelegatesCollector

extension VenueDelegatesCollector: AppDelegatesCollector {

    func delegates() -> [AppDelegateHandler] {
        VenueAssembliesCollector.collect()
        let delegates = AssembliesHolder.container.resolve([AppDelegateHandler].self).unwrap()
        return delegates
    }
}
