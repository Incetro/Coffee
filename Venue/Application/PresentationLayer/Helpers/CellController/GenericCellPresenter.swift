//
//  GenericCellPresenter.swift
//  Venue
//
//  Created by incetro on 03/04/2018.
//  Copyright © 2018 incetro. All rights reserved.
//

import UIKit

// MARK: - GenericCellPresenter

public typealias TableCellPresenter = CellPresenter<UITableView>
public typealias CollectionCellPresenter = CellPresenter<UICollectionView>

open class GenericCellPresenter<T: ReusableCell>: CellPresenter<T.CellHolder> {

    final override public class var cellClass: AnyClass {
        T.self
    }

    final override public func configureCell(_ cell: T.CellHolder.CellType) {
        guard let cell = cell as? T else {
            fatalError("Cell of \(T.CellHolder.CellType.self) must be \(T.self)")
        }
        configureCell(cell)
    }

    final public func currentCell() -> T? {
        innerCurrentCell() as? T
    }

    final override public func willDisplayCell(_ cell: T.CellHolder.CellType) {
        guard let cell = cell as? T else {
            fatalError("Cell of \(T.CellHolder.CellType.self) must be \(T.self)")
        }
        willDisplayCell(cell)
    }

    final override public func didEndDisplayingCell(_ cell: T.CellHolder.CellType) {
        //guard let cell = cell as? T else {
        //    fatalError("Cell of \(T.CellHolder.CellType.self) must be \(T.self)")
        //}
        if let cell = cell as? T {
            didEndDisplayingCell(cell)
        }
    }

    open func configureCell(_ cell: T) {
    }

    open func willDisplayCell(_ cell: T) {
    }

    open func didEndDisplayingCell(_ cell: T) {
    }
}
