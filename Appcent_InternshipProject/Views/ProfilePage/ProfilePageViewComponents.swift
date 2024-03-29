//
//  ProfilePageViewComponents.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 15.07.2021.
//

import UIKit

extension ProfilePageViewController {
    
    func createView(){
        register()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = UIView()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    func register(){
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: Constants.HEADERTABLE_IDENTIFIER)
        tableView.register(SingleMenuTableViewCell.self, forCellReuseIdentifier: Constants.SINGLEMENU_IDENTIFIER)
        tableView.register(ToggleMenuTableViewCell.self, forCellReuseIdentifier: Constants.TOGGLEMENU_IDENTIFIER)
    }
    
}
