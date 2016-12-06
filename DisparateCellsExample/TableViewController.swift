//
//  TableViewController.swift
//  DisparateCellsExample
//
//  Created by David Taylor on 12/2/16.
//  Copyright © 2016 David Taylor. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    private let myDataSource = TableViewDataSource()
    private var myTableViewDataSource: UITableViewDataSource?

    override func viewDidLoad() {
        title = "Disparate Cells"
        // Have to retain the tableview data source because the tableview only has a weak reference
        myTableViewDataSource = myDataSource.tableViewDataSource()
        myDataSource.registerReusableCells(with: tableView)
        tableView.dataSource = myTableViewDataSource
    }
    
}

