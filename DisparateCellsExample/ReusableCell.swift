//
//  ReusableCell.swift
//  DisparateCellsExample
//
//  Created by David Taylor on 12/2/16.
//  Copyright © 2016 David Taylor. All rights reserved.
//

import Foundation

protocol ReusableCell {
    static var cellReuseIdentifier: String { get }
}

extension ReusableCell {
    static var cellReuseIdentifier: String {
        return String(describing: Self.self)
    }
}

