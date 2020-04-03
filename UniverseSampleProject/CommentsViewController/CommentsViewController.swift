//
//  CommentsViewController.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var comments = [Comment]()
    var post: Post?
    
    var commentsView: CommentsView = {
        let view = CommentsView()
        return view
    }()

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        commentsView.commentsVC = self
        
        title = "Comments"
        
        commentsView.commentsTableView.register(CommentsCell.self, forCellReuseIdentifier: CommentsCell.commentsReuseIdentifier)
        commentsView.commentsTableView.dataSource = self
        commentsView.commentsTableView.delegate = self
        
        navigationBarSetup()
        
        getComments()
        
        commentsView.userPostsImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileButtonPressed)))
    }
    
    
    // MARK: - Helper Methods
    
    @objc private func profileButtonPressed() {
        let userPostsViewController = UserPostsViewController()
        userPostsViewController.post = post
        navigationController?.pushViewController(userPostsViewController, animated: true)
    }
    
    private func navigationBarSetup() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .black
    }

    private func getComments() {
        guard let post = post else { return }
        NetworkManager.shared.getComments(with: post.userId) { [weak self] result in
            guard let self = self else  { return }
            
            switch result {
            case .success(let comments):
                self.comments = comments
                
                DispatchQueue.main.async {
                    self.commentsView.commentsTableView.reloadData()
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}


// MARK: - TableView Delegate and DataSource
extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentsCell.commentsReuseIdentifier, for: indexPath) as? CommentsCell else {
            
            return UITableViewCell()
        }
        
        let comment = comments[indexPath.row]
        cell.set(comment: comment)
        
        return cell
    }
    
    
}
