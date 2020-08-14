//
//  PeopleTableVC.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/21/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class PeopleTableVC: UIViewController {
    @IBOutlet var peopleTableView: UITableView!
    private var people: [Person]?
    private var allPeople : [Person] = []
    private var cellIdentifier = "PeopleCell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "People"
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
                 NetworkManager().fetchPeople(page: "1") { (people) in
                 self.people = people
                 DispatchQueue.main.async{
                   self.peopleTableView.reloadData()
                 }
            }
    }

}

extension PeopleTableVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PeopleCell else {
                  fatalError("Issue dequeuing \(cellIdentifier)")
                }
        cell.configure(with: people?[indexPath.row] ?? Person(name: "Wait for it"))
        print()
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = people?.count ?? 10 - 1
        if indexPath.row == lastItem {
            let page = 2
            loadMoreData(page: page)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func loadMoreData(page: Int) {
        NetworkManager().fetchPeople(page: "\(page)") { (people) in
             self.people = people
             DispatchQueue.main.async{
               self.peopleTableView.reloadData()
             }
        }
    }

    
}
