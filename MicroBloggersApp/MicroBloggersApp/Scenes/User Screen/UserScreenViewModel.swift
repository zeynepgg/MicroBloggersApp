//
//  UserScreenViewModel.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 6.04.2022.
//

import Foundation
import MicroBloggersAppAPI

//burada kullanacağımız şeyleri içinde tanımlıyoruz
protocol UserScreenViewModelProtocol {
    var delegate: UserScreenViewModelDelegate? {get set}
    var numberOfItems: Int {get}
    func choosenUser() -> User?
    func getPosts() -> [Post]?
    func loadUsers()
    func user(index: Int) -> User?
    func loadPosts(index: Int)
    
}
//haber edeceklerimiz
protocol UserScreenViewModelDelegate: AnyObject{
    func reloadData()
    func performSegue()
}

final class UserScreenViewModel{
    
    weak var delegate: UserScreenViewModelDelegate?
    let service: UserServiceProtocol
    
    var selectedUser: User?
    var posts: [Post]?
    
    private var users = [User](){
        didSet{
           // DispatchQueue.main.async {
                self.delegate?.reloadData()
            //}
        }
    }
    init(service: UserServiceProtocol) {
        self.service = service
    }
    
    fileprivate func fetchUsers(){
        service.fetchData(route: .fetchUsers, expecting: [User].self , parameters: nil) { response  in
            switch response {
            case .success(let users):
                self.users = users
            case .failure(let error):
                print(error)
            }
        }
    }
    fileprivate func fetchPosts(user: User){
        var params: [String:String]?
        selectedUser = user
        if let choosenUser = selectedUser{
            params = ["userId": "\(choosenUser.id)"]
        }
        service.fetchData(route: .fetchPostsOfUsers, expecting: [Post].self, parameters: params) { response in
            switch response {
            case .success(let posts):
                self.posts = posts
                DispatchQueue.main.async {
                    self.delegate?.performSegue()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension UserScreenViewModel: UserScreenViewModelProtocol{
    func choosenUser() -> User? {
        return selectedUser
    }
    
    func getPosts() -> [Post]? {
        return posts
    }
    
   
    var numberOfItems: Int {
        users.count
    }
    
    func loadUsers() {
        fetchUsers()
    }
    
    func user(index: Int) -> User? {
        users[index]
    }
    
    func loadPosts(index: Int) {
        fetchPosts(user: users[index])
    }
    
    
}
