//
//  VehicleCell.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 8/3/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class VehicleCell: UITableViewCell {

    @IBOutlet var nameVehicleLabel: UILabel!
    
    func configure(with vehicle: Vehicle) {
        nameVehicleLabel.text = vehicle.name
        }

}
