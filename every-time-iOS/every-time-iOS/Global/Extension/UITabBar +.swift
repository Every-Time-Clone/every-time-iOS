//
//  UITabBar +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/17.
//

import UIKit

extension UITabBar {
    
    func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = .white
    }
}
