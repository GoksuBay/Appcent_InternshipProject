//
//  ShoppingViewComponent.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 20.07.2021.
//

import UIKit

extension ShoppingViewController{
    func createCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        self.collectionView.frame = view.bounds
        self.collectionView.backgroundColor = .white
        self.view.addSubview(collectionView)
        
        
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height:300)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wearList == nil ? 0 : self.wearList.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .systemGray6
        
        let wearList = self.wearList.atIndexPath(indexPath.row)
        cell.category.text = wearList.category
        cell.title.text = wearList.title
        cell.rate.text = String(wearList.rate)
        cell.price.text = wearList.price
        cell.discountedPrice.text = wearList.oldPrice
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: cell.discountedPrice.text!)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        cell.discountedPrice.attributedText = attributeString
        return cell
    }
    
    
}


