//
//  BouncingButton.swift
//  Venue
//
//  Created by incetro on 28/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - BouncingButton

open class BouncingButton: TouchSizeButton {

    public var bouncingTransform: CGAffineTransform = .init(scaleX: 0.87, y: 0.87)
    public var isBouncingEnabled = true

    override public var isHighlighted: Bool {
        didSet {
            guard isBouncingEnabled else {
                return
            }
            let transform: CGAffineTransform = isHighlighted ? bouncingTransform : .identity
            animate(transform)
        }
    }
}

extension BouncingButton {

    private func animate(_ transform: CGAffineTransform) {
        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 3,
            options: [.curveEaseInOut]) {
            self.transform = transform
        }
    }
}
