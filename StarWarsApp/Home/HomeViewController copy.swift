//
//  HomeViewController.swift
//  
//
//  Created by Darko Stojanov on 7/20/20.
//

import UIKit
 private let categories: [Category] = [.films, .people, .planets, .species, .starships, .vehicles]

class HomeViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.navigationItem.title = "Category"
        // Do any additional setup after loading the view.
    }
  
}



extension HomeViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        cell.configure(with: categories[indexPath.row])
        
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            performSegue(withIdentifier: "showFilms", sender: self)
        }
        if indexPath.row == 1 {
            performSegue(withIdentifier: "showPeople", sender: self)
        }
        if indexPath.row == 2 {
            performSegue(withIdentifier: "showPlanets", sender: self)
        }
        if indexPath.row == 3 {
            performSegue(withIdentifier: "showSpecies", sender: self)
        }
        if indexPath.row == 4{
            performSegue(withIdentifier: "showStarships", sender: self)
        }
        if indexPath.row == 5 {
            performSegue(withIdentifier: "showVehicles", sender: self)
        }
    }
    
}


