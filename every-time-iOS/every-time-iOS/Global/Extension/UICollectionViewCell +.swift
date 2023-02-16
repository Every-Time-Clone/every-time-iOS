//
//  UICollectionViewCell +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/16.
//

import UIKit

extension UICollectionViewCell {
    
    static var cellIdentifier: String {
        return String(describing: self)
    }
    
    func setMenuBorder() {
        self.contentView.backgroundColor = .clear
        self.contentView.layer.cornerRadius = 13
        self.contentView.layer.borderColor = UIColor.systemGray5.cgColor
        self.contentView.layer.borderWidth = 1
    }
}
