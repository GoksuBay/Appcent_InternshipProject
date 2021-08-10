//
//  CartViewComponent.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 10.08.2021.
//

import UIKit

extension CartViewController :  UITableViewDelegate, UITableViewDataSource{
    
    func createTableView(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func createView(){
        createTableView()
        
        self.view.addSubview(totalPrice)
        totalPrice.translatesAutoresizingMaskIntoConstraints = false
        totalPrice.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -66).isActive = true
        totalPrice.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        totalPrice.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1, constant: 1).isActive = true
        totalPrice.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        totalPrice.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        totalPrice.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
        totalPrice.textColor = .darkGray
        totalPrice.text =  "Toplam: " + String.init(format: "%.2f", ShoppingCartService.shared.getTotalPrice()) + "₺"
        
        self.view.addSubview(paymentButton)
        paymentButton.translatesAutoresizingMaskIntoConstraints = false
        paymentButton.backgroundColor = .systemOrange
        paymentButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -106).isActive = true
        paymentButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        paymentButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 216).isActive = true
        paymentButton.layer.masksToBounds = true
        paymentButton.layer.cornerRadius = 10
        paymentButton.setTitle("Ödemeye Geç", for: .normal)
        paymentButton.setTitleColor(.white, for: .normal)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingCartService.shared.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        let result = ShoppingCartService.shared.getCartItems()
        cell.priceLabel.text = String.init(format: "%.2f", Double(Int(result[indexPath.row].product.price)! * result[indexPath.row].count ) / 100)
        cell.rateLabel.text = String(result[indexPath.row].product.rate)
        cell.titleLabel.text = result[indexPath.row].product.title
        cell.discountLabel.isHidden = !(result[indexPath.row].product.hasDiscound ?? false)
        cell.image.getImage(with: result[indexPath.row].product.images[0])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ShoppingCartService.shared.removeItem(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            totalPrice.text =  "Toplam: " + String.init(format: "%.2f", ShoppingCartService.shared.getTotalPrice()) + "₺"
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?
    {
         return "Ürünü Sil"
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 200
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        tableView.reloadData()
    }
    
    
}

