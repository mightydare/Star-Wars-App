//
//  FilmCell.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/20/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class FilmCell: UITableViewCell {

    @IBOutlet var titleFilmCell: UILabel!
    @IBOutlet var subtitleFilmText: UILabel!
    
   func configure(with film: Film) {
      titleFilmCell.text = film.title
      subtitleFilmText.text = String(film.episodeId)
    }
    
}
