//
//  PostDetailsScreen.swift
//  MicroBloggersApp
//
//  Created by Zeynep Gizem Gürsoy on 6.04.2022.
//

import UIKit


class PostDetailsScreen: UIViewController {
    

    @IBOutlet weak var postBodyView: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    
    var viewModel: PostDetailScreenModelViewProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

        // Do any additional setup after loading the view.
    }
    func configure(){
        postTitleLabel.text = viewModel.post?.title
        postBodyView.text = viewModel.post?.body
    }
    
    @IBAction func viewCommentsButtonClicked(_ sender: UIButton) {
        let senderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoryboardIdentifiers.postComments.description) as! PostCommentsScreen
        let commentViewModel = PostCommentsScreenViewModel()
        senderVC.viewModel = commentViewModel
        commentViewModel.postId = viewModel.post?.id
        
        senderVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(senderVC, animated: true, completion: nil)
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension PostDetailsScreen: PostDetailScreenModelViewDelegate{

}
