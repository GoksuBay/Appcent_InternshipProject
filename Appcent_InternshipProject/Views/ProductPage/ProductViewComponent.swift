//
//  ProductViewComponent.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 6.08.2021.
//

import UIKit

extension ProductViewController : UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    func createView(){
        
        createCollectionView()
        
        self.view.addSubview(category)
        category.translatesAutoresizingMaskIntoConstraints = false
        category.text = "Erkek giyim"
        category.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -36).isActive = true
        category.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        category.font = category.font.withSize(14)
        category.textColor = .darkGray
        
        self.view.addSubview(productTitle)
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        productTitle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 16).isActive = true
        productTitle.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        productTitle.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -156).isActive = true
        productTitle.font = productTitle.font.withSize(22)
        productTitle.lineBreakMode = .byWordWrapping
        productTitle.numberOfLines = 4
        
        self.view.addSubview(desc)
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 116).isActive = true
        desc.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        desc.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        desc.textColor = .darkGray
        desc.lineBreakMode = .byWordWrapping
        desc.numberOfLines = 4
        
        self.view.addSubview(totalPrice)
        totalPrice.translatesAutoresizingMaskIntoConstraints = false
        totalPrice.text = "Toplam Tutar"
        totalPrice.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -156).isActive = true
        totalPrice.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        
        self.view.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
        price.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -126).isActive = true
        price.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        price.font = price.font.withSize(22)
        
        
        self.view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = .systemOrange
        addButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -126).isActive = true
        addButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        addButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 216).isActive = true
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 10
        addButton.setTitle("Sepete ekle", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.addTarget(self, action: #selector(add2Cart), for: .touchUpInside)
        
        self.view.addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 16).isActive = true
        stepper.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        stepper.minimumValue = 1
        stepper.tintColor = .systemOrange
        stepper.setIncrementImage(stepper.incrementImage(for: .normal), for: .normal)
        stepper.setDecrementImage(stepper.decrementImage(for: .normal), for: .normal)
        stepper.layer.borderWidth = 1
        stepper.layer.borderColor = UIColor.systemOrange.cgColor
        stepper.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        
        self.view.addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 56).isActive = true
        amountLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -56).isActive = true
        amountLabel.text = String(Int(stepper.value))
        
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -96).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.pageIndicatorTintColor = .white
        pageControl.numberOfPages = product.images.count
        pageControl.hidesForSinglePage = true
        
    }
    
    func setInfo(){
        category.text = product.category
        productTitle.text = product.title
        desc.text = product.description
        price.text = "₺ " + String.init(format: "%.2f", stepper.value * priceValue)
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    
    func createCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 400), collectionViewLayout: layout)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier)
        self.view.addSubview(collectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height:collectionView.bounds.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {

        let totalCellWidth = collectionView.bounds.width * CGFloat.init(product.images.count)
        let totalSpacingWidth = 0 * (product.images.count - 1)

        let leftInset = (collectionView.bounds.width - CGFloat(totalCellWidth + CGFloat.init(totalSpacingWidth))) / 2
        let rightInset = leftInset

        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.product.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        cell.imageView.getImage(with: product.images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        self.pageControl.currentPage = Int(roundedIndex)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    

    
}
