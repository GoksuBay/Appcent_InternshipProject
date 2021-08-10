//
//  TableViewCell.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 10.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell , ReusableView {
    
    let image = UIImageView()
    let discountLabel = UILabel()
    let titleLabel = UILabel()
    let starImage = UIImageView()
    let priceLabel = UILabel()
    let rateLabel = UILabel()
    
    func createView(){
        
        image.image = UIImage(named: "testTshirt")
        self.contentView.addSubview(image)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 30
        image.layer.cornerCurve = .circular
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, constant: -30).isActive = true
        image.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: -250).isActive = true
        image.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        image.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16).isActive = true
        
        self.image.addSubview(discountLabel)
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.textColor = .white
        discountLabel.backgroundColor = .systemGreen
        discountLabel.layer.cornerRadius = 6
        discountLabel.layer.masksToBounds = true
        discountLabel.topAnchor.constraint(equalTo: self.image.topAnchor, constant: 16).isActive = true
        discountLabel.rightAnchor.constraint(equalTo: self.image.rightAnchor, constant: -16).isActive = true
        discountLabel.text = "İndirim"
        
        self.contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .gray
        titleLabel.layer.masksToBounds = true
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 196).isActive = true
        titleLabel.text = "Baskılı Tişört Pamuklu Bisiklet Yaka"
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 2
        
        self.contentView.addSubview(starImage)
        starImage.tintColor = .systemYellow
        starImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 66).isActive = true
        starImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: -5).isActive = true
        starImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.1).isActive = true
        starImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.1).isActive = true
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.image = UIImage(systemName: "star.fill")
        starImage.layer.masksToBounds = true
        starImage.contentMode = .scaleAspectFit
        
        self.contentView.addSubview(rateLabel)
        rateLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 66).isActive = true
        rateLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 25).isActive = true
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        rateLabel.layer.masksToBounds = true
        rateLabel.textColor = .black
        rateLabel.text = "4.7"
        
        self.contentView.addSubview(priceLabel)
        priceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 25).isActive = true
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.layer.masksToBounds = true
        priceLabel.textColor = .black
        priceLabel.text = "1,99"
        priceLabel.font = priceLabel.font.withSize(30)
        
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
