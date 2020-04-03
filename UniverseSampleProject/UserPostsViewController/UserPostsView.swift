//
//  UserPostsView.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class UserPostsView: UIView {
    
    // MARK: - SetupUserPostsViewController
    weak var userPostsVC: UserPostsViewController? {
        didSet {
            setupVC()
            configuredViews()
        }
    }
    
    private func setupVC() {
        translatesAutoresizingMaskIntoConstraints = false
        if let userPostsVC = userPostsVC {
            userPostsVC.view.addSubview(self)
            
            leftAnchor.constraint(equalTo: userPostsVC.view.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: userPostsVC.view.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: userPostsVC.view.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: userPostsVC.view.bottomAnchor).isActive = true
        }
        
    }
    
    // MARK: - Properties

    let userPostsTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 150
        tableView.backgroundColor = .mainTableViewBackgroundColor
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Helper Methods
    
    private func configuredViews() {
        configureTableViews()
    }
    
    // MARK: - Setup Views and Constraints
    
    private func configureTableViews() {
        addSubview(userPostsTableView)
        userPostsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userPostsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            userPostsTableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            userPostsTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            userPostsTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
