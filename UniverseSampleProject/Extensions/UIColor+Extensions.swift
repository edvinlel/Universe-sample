//
//  UIColor+Extensions.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

extension UIColor {

    
    // MARK: - Properties
    
    
    // Custom colors used throughout the application
    static let mainBackgroundColor = UIColor.rgb(red: 246, green: 246, blue: 246, alpha: 1)
    static let mainFontColor = UIColor.rgb(red: 83, green: 83, blue: 83, alpha: 1)
    static let mainTableViewBackgroundColor = UIColor.rgb(red: 229, green: 237, blue: 243, alpha: 1)
    static let commentsTableViewBackgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1)
    
    
    // MARK: - Helper Methods
    
    private static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}
