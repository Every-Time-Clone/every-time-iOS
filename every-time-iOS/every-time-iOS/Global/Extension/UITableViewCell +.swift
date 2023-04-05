//
//  UITableViewCell +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/16.
//

import UIKit

extension UITableViewCell {
    
    static var cellIdentifier: String {
        return String(describing: self)
    }
    
    func setAlertWithCancelAndOK(_ title: String, okHandler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let okButtonAction = UIAlertAction(title: "확인", style: .default, handler: okHandler)
        alert.addActions(cancelAction, okButtonAction)
        return alert
    }
}
