//
//  ShoppingCartService.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 9.08.2021.
//

import Foundation

class ShoppingCartService {
    
    static let shared = ShoppingCartService()
    
    private var productList : [ShoppingModel] = []
    
    func addtoCart(item:ShoppingModel){
        productList.append(item)
    }
    
    func isEmpty() -> Bool{
        return productList.count == 0
    }
}
