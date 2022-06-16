//
//  PostCommentsScreen.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 6.04.2022.
//

import UIKit

import CollectionViewExtension

class PostCommentsScreen: UIViewController {
   
    @IBOutlet weak var commentsCollectionView: UICollectionView!
    
    var viewModel: PostCommentsScreenViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        commentsCollectionView.dataSource = self
        commentsCollectionView.delegate = self
        commentsCollectionView.register(cellType: CommentCell.self)
        commentsCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionFlowLayout = UICollectionViewFlowLayout()

        collectionFlowLayout.estimatedItemSize = CGSize(width: commentsCollectionView.frame.width, height: 50)
        commentsCollectionView.collectionViewLayout = collectionFlowLayout

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadComments()
    }
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension PostCommentsScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = commentsCollectionView.dequeCell(cellType: CommentCell.self, indexPath: indexPath)
        if let comment = viewModel.comments(index: indexPath.row){
            cell.configure(comment: comment)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: view.frame.width, height: view.frame.height/4)
        let frameSize = collectionView.frame.size
        return CGSize(width: frameSize.width - 20, height: view.frame.height/3)
    }
    
    
}

extension PostCommentsScreen: PostCommentsScreenViewModelDelegate{
    func reloadData() {
        commentsCollectionView.reloadData()
    }
    
    
}
