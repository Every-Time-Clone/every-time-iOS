//
//  UITextField +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/05.
//

import UIKit

extension UITextField {
    
    func addLeftPadding(width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
    
    func addRightImage(image: UIImage) {
        let rightContainerView = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + 10, height: image.size.height))
        let rightImage = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        rightImage.image = image
        rightImage.tintColor = .lightGray
        rightContainerView.addSubview(rightImage)
        rightView = rightContainerView
        rightViewMode = .always
    }
}
