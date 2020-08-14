//
//  FilmViewController.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/20/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {

    @IBOutlet var filmTableView: UITableView!
    private let cellIdentifier =  "FilmCell"
    private var films: [Film]?
    var networkManager = NetworkManager()
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.navigationItem.title = "Film"
        filmTableView.delegate = self
        filmTableView.dataSource = self
        
        //to do hide table till fetchFilms finishes
        
        NetworkManager().fetchFilms { (films) in
          self.films = films
            print(films)
          DispatchQueue.main.async{
            self.filmTableView.reloadData()
          }
        }
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedFilm" {
            let destVC = segue.destination as! DetailedFilmVC
            destVC.film = sender as? Film
        }
    }

}


extension FilmViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FilmCell else {
           fatalError("Issue dequeuing \(cellIdentifier)")
         }
        cell.configure(with: films?[indexPath.row] ?? Film(title: "Wookies are working", episodeId: 1, opening_crawl: "Tantanataaaa taaaa", director: "Darko Stojanov"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let film = films![indexPath.row]
        performSegue(withIdentifier: "detailedFilm", sender: film)
    }
  
 
    
    
}

