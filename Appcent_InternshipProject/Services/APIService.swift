//
//  APIService.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 13.07.2021.
//

import Foundation

class APIService{
    static let shared = APIService()
    
    /* This function is private to avoid using type parameters. There are auxiliary function to define type*/
    private func postType(type: Int, completion:@escaping (_ wearData:[WearModel]? , _ foodData:[FoodModel]? , _ error: Error?) -> Void){
        switch type {
            case 1:
                guard let url = URL(string: Constants.URL + "/products")
                else {
                    completion(nil,nil,nil) // TODO: Return Error as String, write a Extension for this.
                    return
                }
                
                let JSON : [String:Any] = [
                    "type" : type
                ]
                
                do {
                    let data = try JSONSerialization.data(withJSONObject: JSON, options: [])
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.httpBody = data
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.addValue("application/json", forHTTPHeaderField: "Accept")
                    request.addValue(Constants.AUTHORIZATION, forHTTPHeaderField: "Authorization")
                    print(request.allHTTPHeaderFields)
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        
                        if let error = error {
                            completion(nil,nil,error)
                        }
                        if let data = data{
                            let wears = try? JSONDecoder().decode([WearModel].self, from: data)
                            wears == nil ? completion(nil,nil,error) : completion(wears,nil,nil)
                        }
                    }.resume()
                } catch {
                    print("error")
                }
   
                break
            case 2:
                guard let url = URL(string: Constants.URL + "/products")
                else {
                    completion(nil,nil,nil) // TODO: Return Error as String, write a Extension for this.
                    return
                }
                
                let JSON : [String:Any] = [
                    "type" : type
                ]
                
                do {
                    let data = try JSONSerialization.data(withJSONObject: JSON, options: [])
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.httpBody = data
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.addValue("application/json", forHTTPHeaderField: "Accept")
                    request.addValue(Constants.AUTHORIZATION, forHTTPHeaderField: "Authorization")
                    print(request.allHTTPHeaderFields)
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        if let error = error {
                            completion(nil,nil,error)
                        }
                        if let data = data{
                            let foods = try? JSONDecoder().decode([FoodModel].self, from: data)
                            foods == nil ? completion(nil,nil,error) : completion(nil,foods,nil)
                        }
                    }.resume()
                } catch {
                    print("error")
                }
               
                break
            default:
                completion(nil,nil,nil) // TODO: Return Error as String, write a Extension for this.
                break
            
        }
    }
    
    
    func getWears(completion:@escaping (_ wearData:[WearModel]? , _ error: Error?) -> Void){
        postType(type: Constants.WEARTYPE) { wearModel, foodModel, error in
            completion(wearModel,error)
        }
    }
    
    func getFoods(completion:@escaping (_ foodData:[FoodModel]? , _ error: Error?) -> Void){
        postType(type: Constants.FOODTYPE) { wearModel, foodModel, error in
            completion(foodModel,error)
        }
    }
}
