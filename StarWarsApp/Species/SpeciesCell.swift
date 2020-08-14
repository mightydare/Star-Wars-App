//
//  SpeciesCell.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/24/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class SpeciesCell: UITableViewCell {

    @IBOutlet var speciesNameLabel: UILabel!
    func configure(with specie: Specie) {
     speciesNameLabel.text = specie.name
    }

}
