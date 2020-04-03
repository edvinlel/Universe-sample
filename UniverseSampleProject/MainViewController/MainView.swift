//
//  MainView.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    // MARK: - 
    
    weak var mainVC: MainViewController? {
        didSet {
            setupVC()
            configuredViews()
        }
    }
    
    lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .mainTableViewBackgroundColor
        tv.rowHeight = 150
        tv.separatorStyle = .none
        return tv
    }()

    
    
    private func setupVC() {
        translatesAutoresizingMaskIntoConstraints = false
        if let mainVC = mainVC {
            mainVC.view.addSubview(self)
            
            leftAnchor.constraint(equalTo: mainVC.view.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: mainVC.view.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: mainVC.view.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: mainVC.view.bottomAnchor).isActive = true
        }
        
    }
    
    private func configuredViews() {
        configureTableView()
    }
    
    private func configureTableView() {
        addSubview(mainTableView)
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainTableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            mainTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }

}
