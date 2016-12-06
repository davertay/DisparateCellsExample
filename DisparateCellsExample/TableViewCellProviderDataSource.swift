//
//  TableViewCellProviderDataSource.swift
//  DisparateCellsExample
//
//  Created by David Taylor on 12/3/16.
//  Copyright © 2016 David Taylor. All rights reserved.
//

import UIKit

protocol TableViewCellProviderDataSource {
    var reusableCellTypes: [ReusableCell.Type] { get }

    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func cellProvider(forRowAt indexPath: IndexPath) -> TableViewCellProvider

    func tableViewDataSource() -> UITableViewDataSource
    func registerReusableCells(with tableView: UITableView)
}

// MARK: - UITableViewDataSource bridge

extension TableViewCellProviderDataSource {
    func tableViewDataSource() -> UITableViewDataSource {
        return TableViewCellProviderDataSourceBridge(providerDataSource: self)
    }
}

// MARK: - Cell Registering

extension TableViewCellProviderDataSource {
    fileprivate func registerReusableCell(_ reusableCellType: ReusableCell.Type, with tableView: UITableView) {
        if let nakedCellType = reusableCellType as? AnyObject.Type {
            tableView.register(nakedCellType, forCellReuseIdentifier: reusableCellType.cellReuseIdentifier)
        }
    }

    func registerReusableCells(with tableView: UITableView) {
        reusableCellTypes.forEach { reusableCellType in
            registerReusableCell(reusableCellType, with: tableView)
        }
    }
}
