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
        
    }

    
    
    
    

}
