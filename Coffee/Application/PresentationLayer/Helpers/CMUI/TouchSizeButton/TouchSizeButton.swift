//
//  TouchSizeButton.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 incetro. All rights reserved.
//

import UIKit

// MARK: - TouchSizeButton

open class TouchSizeButton: UIButton {

    public var addedTouchArea: CGFloat = 0

    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let newBound = CGRect(
            x: self.bounds.origin.x - addedTouchArea,
            y: self.bounds.origin.y - addedTouchArea,
            width: self.bounds.width + 2 * addedTouchArea,
            height: self.bounds.height + 2 * addedTouchArea
        )
        return newBound.contains(point)
    }
}
