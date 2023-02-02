//
//  UIButton +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/02.
//

import UIKit

extension UIButton {
    
    func setPostDetailButton(_ title: String, _ imageName: String) {
        var configuration = UIButton.Configuration.plain()
        var attString = AttributedString(title)
        attString.font = .systemFont(ofSize: 13, weight: .bold)
        attString.foregroundColor = .darkGray
        
        configuration.attributedTitle = attString
        configuration.image = UIImage(systemName:  imageName)
        configuration.preferredSymbolConfigurationForImage = .init(pointSize: 10)
        configuration.imagePadding = CGFloat(5)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 10)
        
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor(r: 248, g: 249, b: 248)
        self.tintColor = .lightGray
        self.configuration = configuration
    }
}
