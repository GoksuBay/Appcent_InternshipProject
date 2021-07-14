//
//  Products.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 13.07.2021.
//

import Foundation

struct WearModel : Decodable {
    var id:Int
    var title:String
    var price:String
    var hasDiscound:Bool?
    var oldPrice:String?
    var rate:Double
    var description:String
    var category:String
    var images: [String]
}

struct FoodModel : Decodable{
    var id:Int
    var title:String
    var price:String
    var image:[String]
}

struct FoodBaseModel : Decodable {
    var banners:[FoodImages]
    var foods:[FoodModel]
}

struct FoodImages : Decodable{
    var image:String
}

