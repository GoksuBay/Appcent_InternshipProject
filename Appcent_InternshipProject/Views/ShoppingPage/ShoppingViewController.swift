//
//  ViewController.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 13.07.2021.
//

import UIKit

class ShoppingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var cartButton: UIBarButtonItem!
    var collectionView : UICollectionView!
    var wearList : WearCollectionViewModel!
    let refreshControl = UIRefreshControl()
    var product : WearModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        fetchData()
        print(ShoppingCartService.shared.isEmpty())
    }

    @objc func tapFavouriteButton(_ sender: UIButton){
        let index = sender.tag
        
        if(!(CoreDataService.shared.addFavourites(wears: wearList.atIndexPath(index)))){alert(message: "Ürün zaten favoriler listenizde")}
    }
    
    func alert(message:String){
        let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    
    @objc func tapCartButton(_ sender: UIButton){
        performSegue(withIdentifier: "cartVC", sender: self)
    }
    

}
