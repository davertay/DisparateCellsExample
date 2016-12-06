//
//  TableViewCellBuilder.swift
//  DisparateCellsExample
//
//  Created by David Taylor on 12/2/16.
//  Copyright © 2016 David Taylor. All rights reserved.
//

import UIKit

class TableViewCellBuilder<Model, Cell: UITableViewCell>: TableViewCellProvider where Cell:ReusableCell, Cell:ConfigurableCell {
    let model: Model

    init(model: Model) {
        self.model = model
    }

    var cellReuseIdentifier: String {
        return Cell.cellReuseIdentifier
    }

    func provideCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        if let cell = cell as? Cell, let model = model as? Cell.Model {
            cell.configure(with: model)
        }
        return cell
    }
}
