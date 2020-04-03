//
//  UIFont+Extensions.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

extension UIFont {
    
    // UIFont(name: "AvenirNext-Bold", size: 18)
    
    
    enum FontStyle: String {
        case demiBold = "DemiBold"
        case bold = "Bold"
        case regular = "Regular"
    }
    
    // Custom font style for fonts used throughout the application.
    static func mainFont(_ style: FontStyle, withSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "AvenirNext-\(style.rawValue)", size: size) else {
            return UIFont()
        }
        return font
    }
}

