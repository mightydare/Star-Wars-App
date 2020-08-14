//
//  SpeciesVC.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/24/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class SpeciesVC: UIViewController {
    @IBOutlet var speciesTableView: UITableView!
    private var specie : [Specie]?
    private var cellIdentifier = "SpeciesCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Species"
        speciesTableView.delegate = self
        speciesTableView.dataSource = self
        NetworkManager().fetchSpecies { (specie) in
                   self.specie = specie
                   DispatchQueue.main.async{
                       self.speciesTableView.reloadData()
                   }
               }
        

        // Do any additional setup after loading the view.
    }
}

extension SpeciesVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specie?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = speciesTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SpeciesCell else {
            fatalError()
        }
        cell.configure(with: specie?[indexPath.row] ?? Specie(name: "Loading", classification: "Loading", skin_colors: "Loading"))
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
