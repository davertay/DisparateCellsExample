//
//  TableViewDataSource.swift
//  DisparateCellsExample
//
//  Created by David Taylor on 12/2/16.
//  Copyright © 2016 David Taylor. All rights reserved.
//

import UIKit

struct TableViewDataSource: TableViewCellProviderDataSource {
    internal var reusableCellTypes = [ReusableCell.Type]()
    fileprivate let providers: [TableViewCellProvider]

    init() {
        var newProviders = [TableViewCellProvider]()

        // TODO:
        // 1.  put the builders in a meta-factory and have the data source query the meta-factory to get a builder for the row instead of using a static array

        for i in 1...50 {
            let model = TitleModel(titleText: "Simple Cell \(i)")
            let builder = TableViewCellBuilder<TitleModel, SimpleCell>(model: model)
            newProviders.append(builder)
        }

        for i in 1...50 {
            let model = SubtitleModel(titleText: "Detail Cell \(i)", subtitleText: "with subtitle")
            let builder = TableViewCellBuilder<SubtitleModel, SubtitledCell>(model: model)
            newProviders.append(builder)
        }

        providers = newProviders

        reusableCellTypes.append(SimpleCell.self)
        reusableCellTypes.append(SubtitledCell.self)
    }
}

// MARK: - TableViewCellProviderDataSource

extension TableViewDataSource {
    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return providers.count
    }
    
    func cellProvider(forRowAt indexPath: IndexPath) -> TableViewCellProvider {
        return providers[indexPath.row]
    }
}
