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
        self.collectionView.refreshControl = self.refreshControl
        
        self.refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.refreshControl.tintColor = .systemYellow
        
        self.cartButton.target = self
        self.cartButton.action = #selector(tapCartButton(_:))
        
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
        
        let wearList = self.wearList.atIndexPath(indexPath.row)
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(tapFavouriteButton), for: .touchUpInside)
        cell.productImage.getImage(with: wearList.images[0])
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "productVC", sender: self)
    }
    
    /* SEGUE NAVIGATOR */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "productVC"){
            let indexPath = collectionView.indexPathsForSelectedItems?.first
            let vc = segue.destination as! ProductViewController
            vc.product = wearList.wearList[indexPath!.row]
        }

    }
    
}


