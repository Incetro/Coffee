//
//  UITextField.swift
//  TheRun
//
//  Created by incetro on 3/11/20.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - UITextField

extension UITextField {

    func addLeftSpacing(_ spacing: CGFloat, mode: UITextField.ViewMode = .always) {
        leftViewMode = mode
        leftView = UIView(frame: .init(x: 0, y: 0, width: spacing, height: 0))
    }

    func addRightSpacing(_ spacing: CGFloat, mode: UITextField.ViewMode = .always) {
        rightViewMode = mode
        rightView = UIView(frame: .init(x: 0, y: 0, width: spacing, height: 0))
    }
}
