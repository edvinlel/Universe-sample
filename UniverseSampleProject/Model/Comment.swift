//
//  Comment.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import Foundation

struct Comment: Codable {
    var postId: Int
    var name: String?
    var email: String?
    var body: String?
}
