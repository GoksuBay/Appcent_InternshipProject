//
//  ProfilePageViewController.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 15.07.2021.
//

import UIKit

class ProfilePageViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    
    
    let tableView = UITableView()
    let headerView = HeaderTableViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SINGLEMENU_IDENTIFIER, for: indexPath) as! SingleMenuTableViewCell
        
        switch indexPath.row {
        
        case CellType.privacy.rawValue:
            cell.icon.image = UIImage(systemName: "lock.fill")
            cell.label.text = CellLabel.privacy.rawValue
            break
            
        case CellType.account.rawValue:
            cell.icon.image = UIImage(systemName: "person.fill")
            cell.label.text = CellLabel.account.rawValue
            break
            
        case CellType.help.rawValue:
            cell.icon.image = UIImage(systemName: "message.fill")
            cell.label.text = CellLabel.help.rawValue
            break
            
            // TODO - Add Switch Button
        case CellType.notification.rawValue:
            cell.icon.image = UIImage(systemName: "bell.fill")
            cell.label.text = CellLabel.notification.rawValue
            break
            
        case CellType.info.rawValue:
            cell.icon.image = UIImage(systemName: "info.circle.fill")
            cell.label.text = CellLabel.info.rawValue
            break
            
        case CellType.logout.rawValue:
            cell.icon.image = UIImage(systemName: "escape")
            cell.label.text = CellLabel.logout.rawValue
            break
            
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

}
