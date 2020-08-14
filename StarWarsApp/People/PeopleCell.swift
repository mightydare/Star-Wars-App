//
//  PeopleCell.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/21/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class PeopleCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    
    func configure(with people: Person) {
         nameLabel.text = people.name
       }

}
