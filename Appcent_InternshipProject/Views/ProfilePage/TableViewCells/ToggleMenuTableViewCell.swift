//
//  ToggleMenuTableViewCell.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 16.07.2021.
//

import UIKit

class ToggleMenuTableViewCell: UITableViewCell, ReusableView {
    
    private let icon = UIImageView()
    private let label = UILabel()
    private let switchButton = UISwitch()
    
    private func createView(){
        self.contentView.addSubview(icon)
        icon.topAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -20).isActive = true
        icon.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16).isActive = true
        icon.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.7).isActive = true
        icon.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.1).isActive = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = .orange
        icon.contentMode = .scaleAspectFit
        
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        self.contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -10).isActive = true
        label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 66).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(switchButton)
        switchButton.topAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -10).isActive = true
        switchButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16).isActive = true
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.onTintColor = .orange
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(menu: ProfileMenuItem) {
        icon.image = UIImage(systemName: menu.imageName)
        label.text = menu.title
    }
}
