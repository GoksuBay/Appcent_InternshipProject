//
//  WearsViewModel.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 14.07.2021.
//

import Foundation

struct WearViewModel {
    var wear : WearModel
    
    var id : Int {
        return self.wear.id
    }
    
    var title : String {
        return self.wear.title
    }
    
    var price : String {
        return self.wear.price
    }
    
    var hasDiscound : Bool {
        return self.wear.hasDiscound ?? false
    }
    
    var oldPrice : String {
        return self.wear.oldPrice ?? ""
    }
    
    var rate : Double {
        return self.wear.rate
    }
    
    var description : String {
        return self.wear.description
    }
    
    var category : String {
        return self.wear.category
    }

    var images : [String] {
        return self.wear.images
    }
    
}
