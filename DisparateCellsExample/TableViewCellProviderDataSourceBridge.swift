//
//  TableViewCellProviderDataSourceBridge.swift
//  DisparateCellsExample
//
//  Created by David Taylor on 12/6/16.
//  Copyright © 2016 David Taylor. All rights reserved.
//

// Objc cannot see static dispatch protocol extension methods so we have to implement those in a 
// concrete class. We do this by creating an object that conforms to UITableViewDataSource and it 
// acts as a bridge between the Swift world of TableViewCellProviderDataSource protocol and the
// ObjC world of UITableViewDataSource protocol


import UIKit

@objc class TableViewCellProviderDataSourceBridge: NSObject, UITableViewDataSource {
    fileprivate let providerDataSource: TableViewCellProviderDataSource

    init(providerDataSource: TableViewCellProviderDataSource) {
        self.providerDataSource = providerDataSource
        super.init()
    }
}

// MARK: - UITableViewDataSource

extension TableViewCellProviderDataSourceBridge {
    @objc(numberOfSectionsInTableView:) public func numberOfSections(in tableView: UITableView) -> Int {
        return providerDataSource.numberOfSections()
    }

    @objc(tableView:numberOfRowsInSection:) public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return providerDataSource.numberOfRows(in: section)
    }

    @objc(tableView:cellForRowAtIndexPath:) public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return providerDataSource.cellProvider(forRowAt: indexPath).provideCell(for: tableView, at: indexPath)
    }

    // TODO: implement the rest of the UITableViewDataSource protocol...
    
}
