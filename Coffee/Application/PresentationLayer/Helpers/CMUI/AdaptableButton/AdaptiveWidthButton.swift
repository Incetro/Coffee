//
//  AdaptiveWidthButton.swift
//  CMUI
//
//  Created by incetro on 18/02/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - AdaptiveWidthButton

public final class AdaptiveWidthButton: BouncingButton {

    // MARK: - Initializers

    public init(minWidth width: CGFloat = 90, sideInset inset: CGFloat = 16) {
        super.init(frame: .zero)
        setup(minWidth: width, sideInset: inset)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func setup(minWidth width: CGFloat, sideInset inset: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(greaterThanOrEqualToConstant: width).isActive = true
        contentEdgeInsets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
}
