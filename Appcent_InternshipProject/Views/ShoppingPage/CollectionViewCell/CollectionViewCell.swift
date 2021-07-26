//
//  CollectionViewCell.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 20.07.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell , ReusableView {
    
    let category = UILabel()
    let likeButton = UIButton()
    let title = UILabel()
    let discountedPrice = UILabel()
    let price = UILabel()
    let rate = UILabel()
    let starImage = UIImageView()
    let productImage = UIImageView()
    
    func createView(){
        productImage.image = UIImage(named: "testTshirt")
        productImage.contentMode = .scaleAspectFit
        self.contentView.addSubview(productImage)
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.layer.masksToBounds = true
        productImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, constant: -100).isActive = true
        productImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: 0).isActive = true
        
        self.contentView.addSubview(category)
        category.textColor = .white
        category.translatesAutoresizingMaskIntoConstraints = false
        category.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        category.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16).isActive = true
        category.backgroundColor = .systemYellow
        category.layer.cornerRadius = 6
        category.layer.masksToBounds = true
        
        likeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.contentView.addSubview(likeButton)
        likeButton.imageView?.tintColor = .systemYellow
        likeButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        likeButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -6).isActive = true
        likeButton.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.1).isActive = true
        likeButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.2).isActive = true
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        likeButton.backgroundColor = .white
        likeButton.layer.cornerRadius = likeButton.frame.width / 2
        likeButton.layer.masksToBounds = true
        
        self.contentView.addSubview(title)
        title.textColor = .gray
        title.translatesAutoresizingMaskIntoConstraints = false
        title.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -56).isActive = true
        title.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 6).isActive = true
        title.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16).isActive = true
        title.layer.masksToBounds = true
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 2
        
        self.contentView.addSubview(starImage)
        starImage.tintColor = .systemYellow
        starImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -6).isActive = true
        starImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 6).isActive = true
        starImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.1).isActive = true
        starImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.1).isActive = true
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.image = UIImage(systemName: "star.fill")
        starImage.layer.masksToBounds = true
        starImage.contentMode = .scaleAspectFit
        
        self.contentView.addSubview(rate)
        rate.translatesAutoresizingMaskIntoConstraints = false
        rate.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        rate.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 26).isActive = true
        rate.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16).isActive = true
        
        self.contentView.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
        price.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -6).isActive = true
        price.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16).isActive = true
        price.layer.masksToBounds = true
        
        self.contentView.addSubview(discountedPrice)
        discountedPrice.translatesAutoresizingMaskIntoConstraints = false
        discountedPrice.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -26).isActive = true
        discountedPrice.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16).isActive = true
        discountedPrice.layer.masksToBounds = true
        discountedPrice.font = discountedPrice.font.withSize(15)
        

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
