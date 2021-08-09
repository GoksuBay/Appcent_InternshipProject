//
//  ProductViewComponent.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 6.08.2021.
//

import UIKit

extension ProductViewController {
    
    func createView(){
        self.view.addSubview(category)
        category.translatesAutoresizingMaskIntoConstraints = false
        category.text = "Erkek giyim"
        category.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -86).isActive = true
        category.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        category.font = category.font.withSize(14)
        category.textColor = .darkGray
        
        self.view.addSubview(productTitle)
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        productTitle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -16).isActive = true
        productTitle.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        productTitle.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -156).isActive = true
        productTitle.font = productTitle.font.withSize(22)
        productTitle.lineBreakMode = .byWordWrapping
        productTitle.numberOfLines = 4
        
        self.view.addSubview(desc)
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 86).isActive = true
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
        stepper.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -16).isActive = true
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
        amountLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 16).isActive = true
        amountLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -56).isActive = true
        amountLabel.text = String(Int(stepper.value))
    }
    
    func setInfo(){
        category.text = product.category
        productTitle.text = product.title
        desc.text = product.description
        price.text = "₺ " + String.init(format: "%.2f", stepper.value * priceValue)
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}
