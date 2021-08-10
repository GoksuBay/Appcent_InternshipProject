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
    
    func getCartItems() -> [ShoppingModel]{
        return productList
    }
    
    func getCount() -> Int{
        return productList.count
    }
    
    func removeItem(index:Int){
        productList.remove(at: index)
    }
    
    func getTotalPrice() -> Double{
        var sum : Double = 0
        for product in productList {
            sum += Double(product.product.price)! * Double(product.count)
        }
        
        return sum/100
    }
}
