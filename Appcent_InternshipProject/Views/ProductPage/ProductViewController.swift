//
//  ProductViewController.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 3.08.2021.
//

import UIKit

class ProductViewController: UIViewController {
    
//    let collectionView = UICollectionView()
    var product : WearModel!
    let category = UILabel()
    let productTitle = UILabel()
    let stepper = UIStepper()
    let desc = UILabel()
    let totalPrice = UILabel()
    let price = UILabel()
    let addButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        setInfo()

        // Do any additional setup after loading the view.
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
