//
//  MainViewController.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

// TODO: - In the future, I would make the TableView Cell dynamic for custom height of each cell. Didn't realize there was a time limit for this project.

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    var posts = [Post]()
    
    var mainView: MainView = {
        let view = MainView()
        return view
    }()
    
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainView.mainVC = self
        
        title = "Universe Feed"
        view.backgroundColor = .mainTableViewBackgroundColor
        
        mainView.mainTableView.register(MainCell.self, forCellReuseIdentifier: MainCell.mainCellReuseIdentifier)
        mainView.mainTableView.delegate = self
        mainView.mainTableView.dataSource = self
        
        
        getPosts()
    }
    
    
    // MARK: - Helper Methods
    
    private func getPosts() {
        NetworkManager.shared.getPosts { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let posts):
                self.posts = posts
                DispatchQueue.main.async {
                    self.mainView.mainTableView.reloadData()
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }


}


// MARK: - UITableView Delegate and DataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.mainCellReuseIdentifier, for: indexPath) as? MainCell else {
            return UITableViewCell()
        }
        
        let post = posts[indexPath.row]
        cell.set(post: post)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commentViewController = CommentsViewController()
        let post = posts[indexPath.row]
        
        commentViewController.post = post
        
        navigationController?.pushViewController(commentViewController, animated: true)
    }
}
