//
//  SubtitledCell.swift
//  DisparateCellsExample
//
//  Created by David Taylor on 12/2/16.
//  Copyright © 2016 David Taylor. All rights reserved.
//

import UIKit

class SubtitledCell: UITableViewCell, ReusableCell, ConfigurableCell {

    func configure(with model: SubtitleModel)  {
        self.textLabel?.text = model.titleText
        self.detailTextLabel?.text = model.subtitleText
    }
    
}
