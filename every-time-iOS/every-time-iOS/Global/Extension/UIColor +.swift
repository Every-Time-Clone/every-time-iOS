//
//  UIColor +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/16.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
    
    class var everytimeRed: UIColor {
        return UIColor(r: 199, g: 39, b: 9)
    }
    
    class var everytimeGray: UIColor {
        return UIColor(r: 237, g: 237, b: 236)
    }
}
