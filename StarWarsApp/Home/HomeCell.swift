//
//  HomeCell.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/20/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet var imageCell: UIImageView!
    @IBOutlet var titleCell: UILabel!
    
    func configure(with category: Category) {
      imageCell.image = category.icon
      titleCell.text = category.title
    }

}
