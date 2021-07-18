//
//  HeaderTableViewCell.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 15.07.2021.
//

import UIKit

class HeaderTableViewCell: UITableViewCell, ReusableView {
    
    private let headerLabel = UILabel()
    private let lowerLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView() {
        
        // self.contentView.addsubView or self.addSubview ?
        headerLabel.text = "Göksu Bayram"
        headerLabel.textColor = .orange
        headerLabel.font = UIFont.systemFont(ofSize: 25)
        self.contentView.addSubview(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 20).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16).isActive = true
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        lowerLabel.text = "contact@goksubayram.com"
        lowerLabel.font = UIFont.systemFont(ofSize: 15)
        lowerLabel.textColor = .gray
        self.contentView.addSubview(lowerLabel)
        lowerLabel.topAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 50).isActive = true
        lowerLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16).isActive = true
        lowerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: 100)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(fullName: String, email: String) {
        headerLabel.text = fullName
        lowerLabel.text = email
    }
}
