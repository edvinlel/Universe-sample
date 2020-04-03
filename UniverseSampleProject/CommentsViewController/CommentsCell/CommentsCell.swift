//
//  CommentsCell.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class CommentsCell: UITableViewCell {
    
    
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
    
    static let commentsReuseIdentifier = "commentsReuseIdentifier"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.mainFont(.bold, withSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.mainFont(.regular, withSize: 14)
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainFontColor
        label.font = UIFont.mainFont(.demiBold, withSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    
    
    
    // MARK: - Helper Methods
    
    func set(comment: Comment) {
        nameLabel.text = comment.name ?? ""
        emailLabel.text = comment.email ?? ""
        bodyLabel.text = comment.body ?? ""
    }
    
    private func configuredViews() {
        configureNameLabel()
        configureEmailLabel()
        configureBodyLabel()
    }
    
    
    // MARK: - Views and Constraints
    
    private func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        ])
    }
    
    private func configureEmailLabel() {
        addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            emailLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    private func configureBodyLabel() {
        addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            bodyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            bodyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            bodyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    

}
