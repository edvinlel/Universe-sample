//
//  CommentsView.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class CommentsView: UIView {
    
    // MARK: Setup CommentsViewController

    weak var commentsVC: CommentsViewController? {
        didSet {
            setupVC()
            configuredViews()
        }
    }
    
    private func setupVC() {
        translatesAutoresizingMaskIntoConstraints = false
        if let commentsVC = commentsVC {
            commentsVC.view.addSubview(self)
            
            leftAnchor.constraint(equalTo: commentsVC.view.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: commentsVC.view.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: commentsVC.view.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: commentsVC.view.bottomAnchor).isActive = true
        }
        
    }
    
    
    // MARK: - Properties
    
    let commentsTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 200
        tableView.backgroundColor = .mainTableViewBackgroundColor
        return tableView
    }()
    
    
    /// The profile button image I designed quickly using Sketch.
    let userPostsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "userPosts")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    // MARK: - Helper Methods
    
    private func configuredViews() {
        configureTableView()
        configureImageView()
    }
    
    
    // MARK: - Setup Views and Constraints

    private func configureTableView() {
        addSubview(commentsTableView)
        commentsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            commentsTableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            commentsTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            commentsTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    private func configureImageView() {
        addSubview(userPostsImageView)
        userPostsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userPostsImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            userPostsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            userPostsImageView.heightAnchor.constraint(equalToConstant: 100),
            userPostsImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
