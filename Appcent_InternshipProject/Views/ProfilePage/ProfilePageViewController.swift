//
//  ProfilePageViewController.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 15.07.2021.
//

import UIKit

class ProfilePageViewController: UIViewController {
    
    let tableView = UITableView()
    let headerView = HeaderTableViewCell()
    
    private let menuList: [ProfileMenuItem] = [
        ProfileMenuItem(menuType: .basic, title: "Gizlilik", imageName: "lock.fill"),
        ProfileMenuItem(menuType: .basic, title: "Hesabım", imageName: "person.fill"),
        ProfileMenuItem(menuType: .basic, title: "Yardım", imageName: "message.fill"),
        ProfileMenuItem(menuType: .toggle, title: "Bildirimler", imageName: "bell.fill"),
        ProfileMenuItem(menuType: .basic, title: "Bilgi", imageName: "info.circle.fill"),
        ProfileMenuItem(menuType: .basic, title: "Çıkış Yap", imageName: "escape"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
}

// MARK: - UITableView Datasource
extension ProfilePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = menuList[indexPath.row]
        
        switch item.menuType {
            case .basic:
                
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: SingleMenuTableViewCell.reuseIdentifier,
                    for: indexPath
                ) as! SingleMenuTableViewCell

                cell.configureCell(menu: item)
                return cell
                
            case .toggle:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: ToggleMenuTableViewCell.reuseIdentifier,
                    for: indexPath
                ) as! ToggleMenuTableViewCell
                
                cell.configureCell(menu: item)
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
}

// MARK: - UITableViewDelegate
extension ProfilePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
