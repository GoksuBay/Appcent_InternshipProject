//
//  ProductViewController.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 3.08.2021.
//

import UIKit

class ProductViewController: UIViewController , UICollectionViewDelegateFlowLayout{
    
//    let collectionView = UICollectionView()
    var product : WearModel!
    let category = UILabel()
    let productTitle = UILabel()
    let stepper = UIStepper()
    let desc = UILabel()
    let totalPrice = UILabel()
    let price = UILabel()
    let addButton = UIButton()
    let amountLabel = UILabel()
    var priceValue : Double!
    var collectionView : UICollectionView!
    let pageControl = UIPageControl()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        product.price = product.price.replacingOccurrences(of: ",", with: "")
        product.price = product.price.replacingOccurrences(of: ".", with: "")
        priceValue = Double.init(product.price.replacingOccurrences(of: ",", with: "."))!/100
        setInfo()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func valueChanged(_ sender: UIStepper!){
        price.text = "₺ " + String.init(format: "%.2f", stepper.value * priceValue)
        amountLabel.text = String(Int(stepper.value))
    }
    
    @objc func add2Cart(){
        ShoppingCartService.shared.addtoCart(item: ShoppingModel.init(product: product, count: Int(stepper.value)))
        self.navigationController?.popToRootViewController(animated: true)
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
