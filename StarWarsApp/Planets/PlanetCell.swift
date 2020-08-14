//
//  PlanetCell.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/23/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class PlanetCell: UITableViewCell {

    @IBOutlet var planetNameLabel: UILabel!
    func configure(with planet: Planet) {
        planetNameLabel.text = planet.name
       }

}
