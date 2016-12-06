//
//  TableViewCellProvider.swift
//  DisparateCellsExample
//
//  Created by David Taylor on 12/2/16.
//  Copyright © 2016 David Taylor. All rights reserved.
//

import UIKit

protocol TableViewCellProvider {
    func provideCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
}
