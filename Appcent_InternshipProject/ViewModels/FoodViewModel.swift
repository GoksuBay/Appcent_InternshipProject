//
//  FoodViewModel.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 14.07.2021.
//

import Foundation

struct FoodViewModel {
    let food : FoodModel
    
    var id : Int {
        return self.food.id
    }
    
    var title : String {
        return self.food.title
    }
    
    var price : String {
        return self.food.price
    }
    
    var image :  [String] {
        return self.food.image
    }
}
