//
//  Products.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 13.07.2021.
//

import Foundation

struct WearModel: Decodable {
    let id: Int
    let title: String
    let price: String
    let hasDiscound: Bool?
    let oldPrice: String?
    let rate: Double
    let description: String
    let category: String
    let images: [String]
}

struct FoodModel: Decodable{
    let id: Int
    let title: String
    let price: String
    let image: String
}

struct FoodBaseModel: Decodable {
    let banners: [FoodImages]
    let foods: [FoodModel]
}

struct FoodImages: Decodable{
    let image: String
}
