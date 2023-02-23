//
//  UIViewController +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/23.
//

import UIKit

extension UIViewController {
    
    func setAlertWithAnimation(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        self.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
            self.dismiss(animated: true)
        }
    }
}

