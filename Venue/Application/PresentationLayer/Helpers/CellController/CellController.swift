//
//  CellController.swift
//  Venue
//
//  Created by incetro on 03/04/2018.
//  Copyright © 2018 incetro. All rights reserved.
//

import UIKit

// MARK: - CellController

open class CellController<T: ReusableCellHolder>: NSObject {

    public weak var reusableCellHolder: T?
    public var indexPath: IndexPath?

    public override init() {
    }

    open class var cellClass: AnyClass {
        fatalError("Must be overriden by children.")
    }

    open func cellFactory() -> T.CellType? {
        nil
    }

    public static var cellIdentifier: String {
        String(describing: cellClass)
    }

    public static func registerCell(on reusableCellHolder: T) {
        let bundle = Bundle(for: cellClass)
        if bundle.path(forResource: cellIdentifier, ofType: "nib") != nil {
            let nib = UINib(nibName: cellIdentifier, bundle: bundle)
            reusableCellHolder.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        } else {
            reusableCellHolder.register(cellClass, forCellWithReuseIdentifier: cellIdentifier)
        }
    }

    final public func cellFromReusableCellHolder(_ reusableCellHolder: T, forIndexPath indexPath: IndexPath) -> T.CellType {
        self.reusableCellHolder = reusableCellHolder
        self.indexPath = indexPath
        let cell = cellFactory() ?? reusableCellHolder.dequeueReusableCell(withReuseIdentifier: type(of: self).cellIdentifier, for: indexPath)
        configureCell(cell)
        return cell
    }

    final public func innerCurrentCell() -> T.CellType? {
        guard let indexPath = indexPath else {
            return nil
        }
        return reusableCellHolder?.cellForItem(at: indexPath)
    }

    open func configureCell(_ cell: T.CellType) {
    }

    open func willDisplayCell(_ cell: T.CellType) {
    }

    open func didEndDisplayingCell(_ cell: T.CellType) {
    }

    open func didSelectCell() {
    }

    open func didDeselectCell() {
    }

    open func shouldHighlightCell() -> Bool {
        true
    }

    open func didHighlightCell() {
    }

    open func didUnhighlightCell() {
    }

    open func cellSize(reusableCellHolder: T) -> CGSize {
        fatalError("Must be overriden by children.")
    }

    open func estimatedCellSize(reusableCellHolder: T) -> CGSize {
        fatalError("Must be overriden by children.")
    }
}
