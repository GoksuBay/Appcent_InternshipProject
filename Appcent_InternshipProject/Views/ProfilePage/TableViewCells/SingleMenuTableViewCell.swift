//
//  SingleMenuTableViewCell.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 16.07.2021.
//

import UIKit

class SingleMenuTableViewCell: UITableViewCell, ReusableView {
    
    private let icon = UIImageView()
    private let label = UILabel()
    private let arrow = UIImageView()
    
    private func createView() {
        self.contentView.addSubview(icon)
        self.contentView.addSubview(label)
        self.contentView.addSubview(arrow)

        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = .orange
        icon.contentMode = .scaleAspectFit
        
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.tintColor = .orange
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -20),
            icon.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            icon.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.7),
            icon.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.1),
            
            label.topAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -10),
            label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 66),
            
            arrow.topAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -10),
            arrow.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16)
        ])
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
