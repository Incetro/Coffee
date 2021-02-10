//
//  AdvancedModule.swift
//  Venue
//
//  Created by Дмитрий Савинов on 02.11.2020.
//

// MARK: - AdvancedModule

protocol AdvancedModule: Module {

    associatedtype Data

    /// Instantiate module as a view
    /// - Parameter data: initial module data
    static func instantiate(withData data: Data) -> View
}

extension AdvancedModule {

    static func instantiate() -> View {
        fatalError("You must use `instantiate(withData:)` method in advanced modules")
    }
}
