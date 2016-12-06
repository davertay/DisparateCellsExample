//
//  SimpleCell.swift
//  DisparateCellsExample
//
//  Created by David Taylor on 12/2/16.
//  Copyright © 2016 David Taylor. All rights reserved.
//

import UIKit

class SimpleCell: UITableViewCell, ReusableCell, ConfigurableCell {

    func configure(with model: TitleModel)  {
        self.textLabel?.text = model.titleText
    }

}
