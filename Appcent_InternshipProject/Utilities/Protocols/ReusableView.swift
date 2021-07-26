//
//  ReusableView.swift
//  Appcent_InternshipProject
//
//  Created by Yusuf Ali Cezik on 16.07.2021.
//

import Foundation

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

// Neden iki tane aynı variable var
extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
