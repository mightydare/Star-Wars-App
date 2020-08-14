//
//  StarshipCell.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/24/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class StarshipCell: UITableViewCell {

    @IBOutlet var starshipLabel: UILabel!
    func configure(with starship: Starship) {
        starshipLabel.text = starship.name
       }

}
