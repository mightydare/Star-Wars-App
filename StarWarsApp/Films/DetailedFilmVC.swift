//
//  DetailedFilmVC.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/21/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class DetailedFilmVC: UIViewController {
    var name :String = ""
    var film : Film?
    
    @IBOutlet var nameLabel: UILabel!
    
    
    @IBOutlet var openingTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = film?.title
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        openingTextField.text = film?.openingCrawl
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
