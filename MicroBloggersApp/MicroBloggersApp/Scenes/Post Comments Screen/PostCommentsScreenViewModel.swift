//
//  PostCommentsScreenViewModel.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 7.04.2022.
//

import Foundation
import MicroBloggersAppAPI

protocol PostCommentsScreenViewModelProtocol{
    var delegate: PostCommentsScreenViewModelDelegate? {get set}
    var postId: Int? {get}
    var numberOfItems: Int {get}
    func comments(index: Int) -> Comment?
    func loadComments()
}
protocol PostCommentsScreenViewModelDelegate: AnyObject{
    func reloadData()
}
final class PostCommentsScreenViewModel{
    weak var delegate: PostCommentsScreenViewModelDelegate?
    var postId: Int?
    let service: UserServiceProtocol = UserService()
    
    var comments = [Comment](){
        didSet{
            DispatchQueue.main.async {
                //self.commentsCollectionView.reloadData()
                self.delegate?.reloadData()
            }
        }
    }
    /*init(service: UserServiceProtocol) {
        self.service = service
    }*/
    private func fetchComments(){
        var params: [String:String]?
        if let postId = postId {
            params = ["postId": "\(postId)"]
        }
        service.fetchData(route: .fetchComments, expecting: [Comment].self, parameters: params) { response in
            switch response {
            case .success(let comments):
                self.comments = comments
                print("yorumlar: \(comments)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
extension PostCommentsScreenViewModel: PostCommentsScreenViewModelProtocol{
    var numberOfItems: Int {
        comments.count
    }
    
    func comments(index: Int) -> Comment? {
        return comments[index]
    }
    func loadComments() {
        fetchComments()
    }

}
