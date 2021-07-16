//
//  ViewController.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 13.07.2021.
//

import UIKit

class ShoppingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        APIService.shared.getProducts(with: .food) {
            (response: Result<FoodBaseModel, AppternError>) in
            
            switch response {
                case .failure(let error):
                    print(error)
                case .success(let res):
                    print(res.foods)
            }
        }
    }
}

