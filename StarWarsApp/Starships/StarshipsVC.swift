//
//  StarshipsVC.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/24/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController {

    @IBOutlet var starshipTableView: UITableView!
    private var starship : [Starship]?
    @IBOutlet var starshipDetailedInfo: UILabel!
    private var cellIdentifier = "StarshipCell"
    @IBOutlet var starshipInfoPicker: UIPickerView!
    private let dataSourceInfoPicker = ["Model" , "Manufacturer", "Starship Class" ,"Cost in Credits"]
    private var selectedPickerView = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Starships"
        starshipTableView.delegate = self
        starshipTableView.dataSource = self
        starshipInfoPicker.dataSource = self
        starshipInfoPicker.delegate = self
        NetworkManager().fetchStarships { (starship) in
            self.starship = starship
            DispatchQueue.main.async{
                self.starshipTableView.reloadData()
            }
        }
    }

}

extension StarshipsVC : UITableViewDelegate , UITableViewDataSource ,UIPickerViewDelegate , UIPickerViewDataSource{
    
    //MARK: - pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSourceInfoPicker.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starship?.count ?? 5
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

       let valueSelected = dataSourceInfoPicker[row]
       selectedPickerView = valueSelected

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSourceInfoPicker[row]
    }
    
//MARK: - tableView
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = starshipTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StarshipCell else {
            fatalError()
        }
        cell.configure(with: starship?[indexPath.row]  ?? Starship(name: "Loading", model: "Loading", manufacturer: "Loading", cost_in_credits: "Loading", starship_class: "Loading"))
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if(selectedPickerView == "Model") {
            starshipDetailedInfo.text = starship?[indexPath.row].model
        }
        if(selectedPickerView == "Manufacturer") {
                   starshipDetailedInfo.text = starship?[indexPath.row].manufacturer
               }
           
        if(selectedPickerView == "Starship Class") {
                          starshipDetailedInfo.text = starship?[indexPath.row].starship_class
                }
        if(selectedPickerView == "Cost in Credits") {
                                 starshipDetailedInfo.text = starship?[indexPath.row].cost_in_credits
                       }
        
    }
    
    
}
