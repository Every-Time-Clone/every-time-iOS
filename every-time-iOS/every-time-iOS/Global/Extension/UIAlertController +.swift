//
//  UIAlertController +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/03.
//

import UIKit

extension UIAlertController {
    
    func addActions(_ actions: UIAlertAction...) {
        actions.forEach { self.addAction($0) }
    }
}
