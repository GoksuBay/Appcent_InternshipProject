//
//  APIService.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 13.07.2021.
//

import Foundation

class APIService {
    
    static let shared = APIService()

    func getProducts<T: Decodable>(with type: ProductType,
                                   completion: @escaping (Result<T, AppternError>) -> Void) {
        let params = ["type": type.rawValue]
        callService(url: Constants.Product.products, method: .post, parameters: params, completion: completion)
    }
}


extension APIService {
    private func callService<T: Decodable>(url: String,
                                           method: MethodType,
                                           parameters: [String: Any]? = nil,
                                           headers: [String: String]? = nil,
                                           completion: @escaping (Result<T, AppternError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.requestError))
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        
        if let parameters = parameters {
            guard let data = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                completion(.failure(.requestError))
                return
            }
            request.httpBody = data
        }
   
        self.setHeaders(request: &request)
        
        execute(request: request, completion: completion)
    }
}

// MARK: - Headers
extension APIService {
    private func setHeaders(request: inout URLRequest, headers: [String: String]? = nil) {
        //Default Headers for all request
        request.addValue(Constants.AUTHORIZATION, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //External Headers
        headers?.forEach({ (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        })
        
        //Log
        print(request.allHTTPHeaderFields ?? [])
    }
}

// MARK: - Execute
extension APIService {
    //Generic network method
    private func execute<T: Decodable>(request: URLRequest,
                                       completion: @escaping (Result<T, AppternError>) -> Void) {
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(.defaultError(error)))
                return
            }
            
            if let jsonResponse = String(data: data!, encoding: String.Encoding.utf8) {
                print("JSON String: \(jsonResponse)")
            }
            
            if let data = data {
                do {
                    let res = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(res))
                } catch (let error) {
                    print("Decode Error: \(error)")
                    completion(.failure(.decodeError))
                }
            }
        }.resume()
    }
}
