//
//  UIStackView +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/16.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {  self.addArrangedSubview($0) }
    }
}
