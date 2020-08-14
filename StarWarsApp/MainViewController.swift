//
//  MainViewController.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/19/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet var extiButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if traitCollection.userInterfaceStyle == .dark {
            navigationController?.navigationBar.barTintColor = UIColor.black
        }
        else {
            navigationController?.navigationBar.barTintColor = UIColor.white
        }

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
           self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       self.navigationController?.setNavigationBarHidden(false, animated: true);
        super.viewWillDisappear(animated)
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
