//
//  MainCell.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    // MARK: - Initialize
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           backgroundColor = .mainTableViewBackgroundColor
           selectionStyle = .none
           
           configuredViews()
           
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    // MARK: - Properties
    
    
    static let mainCellReuseIdentifier = "mainCell"
    static let userPostsCellReuseIdentifier = "userPostsCell"
    
    var imageContainerView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 20
            return view
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFont(.bold, withSize: 18)
        label.textColor = .black
        label.text = "1"
        return label
    }()
    
    let bodyContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFont(.bold, withSize: 14)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mainFont(.regular, withSize: 12)
        label.textColor = .mainFontColor
        label.numberOfLines = 4
        return label
    }()
    
    
    // MARK: - Helper Methods
    
    func set(post: Post) {
        idLabel.text = "\(post.userId)"
        titleLabel.text = post.title ?? ""
        bodyLabel.text = post.body ?? ""
    }
    
    
    // MARK: - Views and Constraints
    
    private func configuredViews() {
        configureProfileImageView()
        configureProfileIdLabel()
        configureBodyContainer()
        configureTitleLabel()
        configureBodyLabel()
    }
    
    private func configureProfileImageView() {
        addSubview(imageContainerView)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            imageContainerView.heightAnchor.constraint(equalToConstant: 40),
            imageContainerView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureProfileIdLabel() {
        imageContainerView.addSubview(idLabel)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            idLabel.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            idLabel.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor)
        ])
    }
    
    private func configureBodyContainer() {
        addSubview(bodyContainerView)
        bodyContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bodyContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bodyContainerView.leftAnchor.constraint(equalTo: imageContainerView.rightAnchor, constant: 15),
            bodyContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            bodyContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    private func configureTitleLabel() {
        bodyContainerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: bodyContainerView.topAnchor, constant: 15),
            titleLabel.leftAnchor.constraint(equalTo: bodyContainerView.leftAnchor, constant: 15),
            titleLabel.rightAnchor.constraint(equalTo: bodyContainerView.rightAnchor, constant: -15)
        ])
    }
    
    private func configureBodyLabel() {
        bodyContainerView.addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bodyLabel.leftAnchor.constraint(equalTo: bodyContainerView.leftAnchor, constant: 15),
            bodyLabel.rightAnchor.constraint(equalTo: bodyContainerView.rightAnchor, constant: -15)
        ])
    }

}
