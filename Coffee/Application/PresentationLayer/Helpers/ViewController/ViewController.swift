//
//  ViewController.swift
//  Coffee
//
//  Created by incetro on 27/11/2019.
//  Copyright © 2019 Incetro Inc. All rights reserved.
//

import UIKit

// MARK: - ViewController

class ViewController: UIViewController, NotifierHolder {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        updateDesignerAppearance()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        (self as? Designable)?.designer.appearance.preferredStatusBarStyle ?? .default
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 12.0, *) {
            guard previousTraitCollection?.userInterfaceStyle.rawValue != traitCollection.userInterfaceStyle.rawValue
            else {
                return
            }
            updateDesignerAppearance()
        }
        notifier.raise(.appearanceChanged)
    }

    func localizeBackButton(withTitle title: String) {
        let backItem = UIBarButtonItem()
        backItem.title = title
        navigationItem.backBarButtonItem = backItem
    }

    // MARK: - Private

    private func updateDesignerAppearance() {
        if #available(iOS 12.0, *) {
            let designer = (self as? Designable)?.designer
            guard designer?.isSystemAppearanceEnabled == true else {
                return
            }
            if traitCollection.userInterfaceStyle == .dark {
                designer?.set(appearance: .dark)
            } else {
                designer?.set(appearance: .light)
            }
        }
    }
}

// MARK: - UIGestureRecognizerDelegate

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}

// MARK: - UIViewController

extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    func hideKeyboardWhenSwipedDown() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        pan.cancelsTouchesInView = false
        view.addGestureRecognizer(pan)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
