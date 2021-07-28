//
//  FavouriteViewController.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 28.07.2021.
//

import UIKit

class FavouriteViewController: UIViewController {

    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            tableView.reloadData()   // ...and it is also visible here.
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
