//
//  ViewController.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 3.04.2022.
//

import UIKit
import CollectionViewExtension

class UserScreen: UIViewController {
    
    @IBOutlet weak var usersCollectionView: UICollectionView!
    
    var viewModel: UserScreenViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usersCollectionView.dataSource = self
        usersCollectionView.delegate = self
        usersCollectionView.register(cellType: UsersCell.self)
        usersCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //fetchUsers() view modelden kullanıcıları al
        viewModel.loadUsers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryboardIdentifiers.userPostScreen.description{
            let destinationVC = segue.destination as! UserPostsScreen
            let postViewModel = UserPostsScreenViewModel()
            destinationVC.viewModel = postViewModel
            
            postViewModel.posts = viewModel.getPosts()
            postViewModel.user = viewModel.choosenUser()
        }
    }
    

}

extension UserScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = usersCollectionView.dequeCell(cellType: UsersCell.self, indexPath: indexPath)
        if let user = viewModel.user(index: indexPath.row){
            cell.configure(user: user)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: view.frame.width, height: view.frame.height/8)
        let frameSize = collectionView.frame.size
        return CGSize(width: frameSize.width - 20, height: frameSize.height/8)
       

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.loadPosts(index: indexPath.row)
        
    }
}

extension UserScreen: UserScreenViewModelDelegate {
    func performSegue() {
        self.performSegue(withIdentifier: StoryboardIdentifiers.userPostScreen.description, sender: self)
    }
    
    func reloadData() {
        usersCollectionView.reloadData()
    }
}
