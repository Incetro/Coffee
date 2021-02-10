//
//  Designable.swift
//  Venue
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - Designable

protocol Designable: class {

    /// Current Designer instance
    var designer: Designer { get }

    /// Colorize element with some Appearance
    ///
    /// - Parameter appearance: some Appearance instance
    func design(appearance: Appearance)
}

extension Designable {

    var designer: Designer {
        AssembliesHolder.container.resolve(Designer.self).unwrap()
    }

    func redesign() {
        design(appearance: designer.appearance)
    }
}
