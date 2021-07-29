//
//  FavouriteViewComponent.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 28.07.2021.
//

import UIKit

extension FavouriteViewController :  UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating{
    
    func createTableView(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func createSearchBar(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive && searchController.searchBar.text! != "" ? CoreDataService.shared.fetchFilteredData(with: searchController.searchBar.text!).count : CoreDataService.shared.fetchFavourites().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(searchController.isActive && searchController.searchBar.text! != ""){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
            let result = CoreDataService.shared.fetchFilteredData(with: searchController.searchBar.text!)
            cell.priceLabel.text = result[indexPath.row].value(forKey: "price") as! String
            cell.rateLabel.text = String(result[indexPath.row].value(forKey: "rate") as! Double)
            cell.titleLabel.text = result[indexPath.row].value(forKey: "title") as! String
            cell.discountLabel.isHidden = !(result[indexPath.row].value(forKey: "hasDiscound") as! Bool)
            cell.image.getImage(with: result[indexPath.row].value(forKey: "image") as! String)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        let result = CoreDataService.shared.fetchFavourites()
        cell.priceLabel.text = result[indexPath.row].value(forKey: "price") as! String
        cell.rateLabel.text = String(result[indexPath.row].value(forKey: "rate") as! Double)
        cell.titleLabel.text = result[indexPath.row].value(forKey: "title") as! String
        cell.discountLabel.isHidden = !(result[indexPath.row].value(forKey: "hasDiscound") as! Bool)
        cell.image.getImage(with: result[indexPath.row].value(forKey: "image") as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let result = CoreDataService.shared.fetchFavourites()
        if editingStyle == .delete {
            CoreDataService.shared.delete(id: result[indexPath.row].value(forKey: "id") as! Int)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?
    {
         return "Ürünü Sil"
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        tableView.reloadData()
    }
    
    
}
