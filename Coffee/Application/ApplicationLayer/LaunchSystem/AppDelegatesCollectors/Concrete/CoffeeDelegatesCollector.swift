//
//  CoffeeDelegatesCollector.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - CoffeeDelegatesCollector

final class CoffeeDelegatesCollector {
}

// MARK: - AppDelegatesCollector

extension CoffeeDelegatesCollector: AppDelegatesCollector {

    func delegates() -> [AppDelegateHandler] {
        CoffeeAssembliesCollector.collect()
        let delegates = AssembliesHolder.container.resolve([AppDelegateHandler].self).unwrap()
        return delegates
    }
}
