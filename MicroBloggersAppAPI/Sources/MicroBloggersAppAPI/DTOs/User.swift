//
//  File.swift
//  
//
//  Created by Zeynep Gizem Gürsoy on 3.04.2022.
//

import Foundation

public struct User: Decodable {
    
    public let id: Int
    public let name: String
    public let username: String
    public let email: String
    public let address: Address?
}

public struct Address: Decodable {
    public let city: String?
}
