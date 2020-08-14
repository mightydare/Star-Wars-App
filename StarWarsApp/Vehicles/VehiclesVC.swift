//
//  VehiclesVC.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 8/3/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController {
    var vehicle : [Vehicle]?
    let cellIdentifier = "VehicleCell"
    @IBOutlet var VechilesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Vehicles"
        VechilesTableView.delegate = self
        VechilesTableView.dataSource = self
        
        NetworkManager().fetchVehicles{(vehicle) in
                self.vehicle = vehicle
            DispatchQueue.main.async {
                self.VechilesTableView.reloadData()
                
            }
        }
        // Do any additional setup after loading the view.
    }

    
    

    

}
extension VehiclesVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicle?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = VechilesTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? VehicleCell else {
            fatalError()
        }
        cell.configure(with: vehicle?[indexPath.row] ?? Vehicle(name: "Loading", model: "Loading", manufacturer: "Loading", cost_in_credits: "Loading", vehicle_class: "Loading"))
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
