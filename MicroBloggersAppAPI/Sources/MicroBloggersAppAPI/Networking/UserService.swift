//
//  File.swift
//
//
//  Created by Zeynep Gizem Gürsoy on 3.04.2022.
//

import Foundation
import Alamofire

public protocol UserServiceProtocol {
    func fetchData<T: Decodable>(
        route: Route,
        expecting: T.Type,
        parameters: [String: Any]?,
        completion: @escaping (Result<T, Error>) -> Void)
}

public class UserService: UserServiceProtocol {
    
    public init () {}
    
    
    public func fetchData<T: Decodable>(route: Route, expecting: T.Type, parameters: [String: Any]?, completion: @escaping  (Result<T, Error>) -> Void) {
        
        let urlString = Route.baseUrl + route.description
        guard let url = URL(string: urlString) else {
            fatalError("Error")
        }
        
        AF.request(url, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(expecting, from: data)
                    completion(.success(response))
                } catch {
                    print("********** JSON DECODE ERROR *********")
                    print(url)
                }
                
            case .failure(let error):
                print("****** GEÇİCİ BİR SORUN OLUŞTU: \(error.localizedDescription) ******")
                
            }
        }
    }
}
