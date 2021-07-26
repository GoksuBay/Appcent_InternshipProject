//
//  ProductList.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 26.07.2021.
//

import Foundation

extension ShoppingViewController {
    
    func fetchData(){
        APIService.shared.getWears { wears, error in
            if let error = error {
                print(error)
                return
            }
            
            self.wearList = WearCollectionViewModel(wearList: wears!)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
}
