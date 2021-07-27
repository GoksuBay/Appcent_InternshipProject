//
//  ViewController.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 13.07.2021.
//

import UIKit

class ShoppingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
       
    var collectionView : UICollectionView!
    var wearList : WearCollectionViewModel!
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        fetchData()
        CoreDataService.shared.fetchFavourites()
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
    
    
    

}
