//
//  ViewController.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 13.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIService.shared.getWears { wm, err in
            print(wm?[1].category)
        }
    }


}

