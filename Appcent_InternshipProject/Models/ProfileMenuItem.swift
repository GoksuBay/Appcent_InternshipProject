//
//  ProfileMenuItem.swift
//  Appcent_InternshipProject
//
//  Created by Yusuf Ali Cezik on 16.07.2021.
//

import Foundation

struct ProfileMenuItem {
    let menuType: MenuType
    let title: String
    let imageName: String
}

enum MenuType {
    case basic
    case toggle
}
