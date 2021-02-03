//
//  UIView.swift
//  CMUI
//
//  Created by incetro on 17/02/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - UIView

extension UIView {

    func smoothlyRoundCourners(_ corners: UIRectCorner = .allCorners, radius: CGFloat, inRect rect: CGRect? = nil) {
        let roundPath = UIBezierPath(
            roundedRect: rect ?? bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        layer.mask = maskLayer
    }

    func subview(withId accessibilityIdentifier: String) -> UIView? {
        subviews.first { $0.accessibilityIdentifier == accessibilityIdentifier }
    }
}
