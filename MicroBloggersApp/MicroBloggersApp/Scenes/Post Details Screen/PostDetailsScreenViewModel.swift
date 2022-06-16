//
//  PostDetailsScreenViewModel.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 6.04.2022.
//

import Foundation
import MicroBloggersAppAPI

protocol PostDetailScreenModelViewProtocol{
    var delegate: PostDetailScreenModelViewDelegate? {get set}
    var post: Post? {get}
}
protocol PostDetailScreenModelViewDelegate: AnyObject{
    
}
final class PostDetailScreenViewModel{
    weak var delegate:  PostDetailScreenModelViewDelegate?
    var post: Post?

}
extension PostDetailScreenViewModel: PostDetailScreenModelViewProtocol{
}
