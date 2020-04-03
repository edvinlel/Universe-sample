//
//  UserPostsViewController.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class UserPostsViewController: UIViewController {
    
    var userPosts = [Post]()
    var post: Post?
    
    let userPostsView: UserPostsView = {
        let view = UserPostsView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userPostsView.userPostsVC = self
        
        view.backgroundColor = .mainTableViewBackgroundColor
        if let post = post {
            title = "\(post.userId)'s Posts"
        } else {
            title = "Posts"
        }
        
        
        userPostsView.userPostsTableView.register(MainCell.self, forCellReuseIdentifier: MainCell.userPostsCellReuseIdentifier)
        userPostsView.userPostsTableView.dataSource = self
        userPostsView.userPostsTableView.dataSource = self
        
        if let post = post {
            getPosts(forUser: post.userId)
        }
    }
    
    private func getPosts(forUser user: Int) {
        NetworkManager.shared.getPosts { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let post):
                
                for i in post {
                    if i.userId == user {
                        self.userPosts.append(i)
                    }
                }
                DispatchQueue.main.async {
//                    print(self.userPosts)
                    
                    self.userPostsView.userPostsTableView.reloadData()
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }

}


extension UserPostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.userPostsCellReuseIdentifier, for: indexPath) as? MainCell else {
            
            return UITableViewCell()
        }
        
        let post = userPosts[indexPath.row]
        cell.set(post: post)
        
        return cell
    }
    
    
}
