//
//  UserPostsScreen.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 6.04.2022.
//

import UIKit
import CollectionViewExtension

class UserPostsScreen: UIViewController {
    

    @IBOutlet weak var postsCount: UILabel!
    @IBOutlet weak var postsCollectionView: UICollectionView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var viewModel: UserPostsScreenViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsCollectionView.dataSource = self
        postsCollectionView.delegate = self
        postsCollectionView.register(cellType: PostCell.self)
        postsCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        configure()
        
        let collectionFlowLayout = UICollectionViewFlowLayout()

        collectionFlowLayout.estimatedItemSize = CGSize(width: postsCollectionView.frame.width, height: 50)
        postsCollectionView.collectionViewLayout = collectionFlowLayout

        // Do any additional setup after loading the view.
    }
    func configure(){
        emailLabel.text = viewModel.user?.email
        nameLabel.text = viewModel.user?.name
        userNameLabel.text = viewModel.user?.username
        cityLabel.text = viewModel.user?.address?.city
        postsCount.text = "\(viewModel.numberOfItems)"
        
    }
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension UserPostsScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postsCollectionView.dequeCell(cellType: PostCell.self, indexPath: indexPath)
        if let post = viewModel.post(index: indexPath.row){
            cell.configure(post: post, user: viewModel.user!)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // return CGSize(width: view.frame.width, height: view.frame.height/4)
        let frameSize = collectionView.frame.size
        return CGSize(width: frameSize.width - 20, height: view.frame.height/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.loadPost(index: indexPath.row)
        
    }
    
}

extension UserPostsScreen: UserPostsScreenViewModelDelegate{
    func reloadData() {
        postsCollectionView.reloadData()
    }
    
    func performSegue() {
        let senderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoryboardIdentifiers.postDetails.description) as! PostDetailsScreen
        senderVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        let postDetailViewModel = PostDetailScreenViewModel()
        senderVC.viewModel = postDetailViewModel
        postDetailViewModel.post = viewModel.choosenPost()
        present(senderVC, animated: true, completion: nil)
    }
    
}
