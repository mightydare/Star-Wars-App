//
//  PlanetVC.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/23/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class PlanetVC: UIViewController {

    @IBOutlet var planetTableView: UITableView!
    private var cellIdentifier = "PlanetCell"
    @IBOutlet var diameterLabel: UILabel!
    @IBOutlet var gravityLabel: UILabel!
    @IBOutlet var terrainLabel: UILabel!
    @IBOutlet var climateLabel: UILabel!
    @IBOutlet var planetNameLabel: UILabel!
    private var planet : [Planet]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Planet"
        planetTableView.delegate = self
        planetTableView.dataSource = self

        NetworkManager().fetchPlanets { (planet) in
                 self.planet = planet
                 DispatchQueue.main.async{
                   self.planetTableView.reloadData()
                 }
               }
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

extension PlanetVC : UITableViewDelegate  , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planet?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = planetTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlanetCell else {
                         fatalError("Issue dequeuing \(cellIdentifier)")
                       }
        cell.configure(with: planet?[indexPath.row] ?? Planet(name: "Tattoine", diameter: "Loading", climate: "Loading", gravity: "Loading", terrain: "Loading"))
               return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell = planet?[indexPath.row]
        planetNameLabel.text = selectedCell?.name.capitalized
        climateLabel.text = selectedCell?.climate.capitalized
        diameterLabel.text = selectedCell?.diameter.capitalized
        terrainLabel.text = selectedCell?.terrain.capitalized
        gravityLabel.text = selectedCell?.gravity.capitalized
        
    }
    
    
  
    
    
}
