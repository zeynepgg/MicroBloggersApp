//
//  Identifiers.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 7.04.2022.
//

import Foundation

enum StoryboardIdentifiers {
    case userScreen
    case userPostScreen
    case postDetails
    case postComments
    
    var description: String {
        switch self {
        case .userScreen:
            return "UserScreen"
        case .userPostScreen:
            return "goToUserPosts"
        case .postDetails:
            return "PostDetailsScreen"
        case .postComments:
            return "PostCommentsScreen"
        }
    }
}
