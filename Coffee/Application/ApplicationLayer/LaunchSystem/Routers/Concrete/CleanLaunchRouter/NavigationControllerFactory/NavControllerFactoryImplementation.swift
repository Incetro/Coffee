//
//  NavigationControllerFactoryImplementation.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit
import DeviceKit

// MARK: - NavigationControllerFactoryImplementation

final class NavControllerFactoryImplementation {
}

// MARK: - NavigationControllerFactory

extension NavControllerFactoryImplementation: NavigationControllerFactory {

    func navigationController() -> UINavigationController {
        if
            let stringVersion = Device.realDevice(from: .current).systemVersion,
            let version = Double(stringVersion), version < 13 {
            let result = UINavigationController()
            result.designer.add(designable: result)
            return result
        } else {
            return BlurredNavigationController()
        }
    }

    func navigationController(withRootViewController rootViewController: UIViewController) -> UINavigationController {
        if
            let stringVersion = Device.realDevice(from: .current).systemVersion,
            let version = Double(stringVersion), version < 13 {
            let result = UINavigationController(rootViewController: rootViewController)
            result.designer.add(designable: result)
            return result
        } else {
            return BlurredNavigationController(rootViewController: rootViewController)
        }
    }
}
