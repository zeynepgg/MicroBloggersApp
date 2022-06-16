//
//  File.swift
//  
//
//  Created by Zeynep Gizem Gürsoy on 3.04.2022.
//

import Foundation

public struct Post: Decodable {
    public let userId: Int
    public let id: Int
    public let title: String
    public let body: String
    
}
