//
//  PhotoCollectionViewCell.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 10.08.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell, ReusableView {
    let imageView = UIImageView()
    let pageControl = UIPageControl()
    
    func createView(){

        self.contentView.addSubview(imageView)
        imageView.image = UIImage(named: "testTshirt")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
