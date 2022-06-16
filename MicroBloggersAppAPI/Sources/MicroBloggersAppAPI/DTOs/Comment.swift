//
//  File.swift
//  
//
//  Created by Zeynep Gizem Gürsoy on 3.04.2022.
//

import Foundation

public struct Comment: Decodable {
    public let postId: Int
    public let id: Int
    public let name: String
    public let email: String
    public let body: String
}
