//
//  File.swift
//  
//
//  Created by Zeynep Gizem Gürsoy on 3.04.2022.
//

import Foundation

public enum Route {
    static let baseUrl = "https://jsonplaceholder.typicode.com"
    
    case fetchUsers
    case fetchPostsOfUsers
    case fetchComments
    
    var description: String {
        switch self {
        case .fetchUsers:
            return "/users"
        case .fetchPostsOfUsers:
            return "/posts" // &userId=1
        case .fetchComments:
            return "/comments" //postId=1
        }
    }
}
