//
//  UserPostsScreenViewModel.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 6.04.2022.
//

import Foundation
import MicroBloggersAppAPI


protocol UserPostsScreenViewModelProtocol{
    var delegate: UserPostsScreenViewModelDelegate? {get set}
    var numberOfItems: Int {get}
    var posts: [Post]? {get}
    var user: User? {get}
    func choosenPost() -> Post?
    func post(index: Int) -> Post?
    func loadPost(index: Int)
    
}
protocol UserPostsScreenViewModelDelegate: AnyObject{
    func reloadData()
    func performSegue()
}
final class UserPostsScreenViewModel{
    weak var delegate: UserPostsScreenViewModelDelegate?
    var posts: [Post]?
    var user: User?
    var selectedPost: Post?
    var postsCount: Int?
    
}

extension UserPostsScreenViewModel: UserPostsScreenViewModelProtocol{
    
    func choosenPost() -> Post? {
        selectedPost
    }
    
    func post(index: Int) -> Post? {
        posts?[index]
    }
    
    func loadPost(index: Int) {
        selectedPost = posts?[index]
        self.delegate?.performSegue()
    }
    
    
    var numberOfItems: Int {
        posts?.count ?? 0
    }
    
    
}
