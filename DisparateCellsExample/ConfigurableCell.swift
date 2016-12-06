//
//  ConfigurableCell.swift
//  DisparateCellsExample
//
//  Created by David Taylor on 12/2/16.
//  Copyright © 2016 David Taylor. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    associatedtype Model
    func configure(with model: Model)
}
