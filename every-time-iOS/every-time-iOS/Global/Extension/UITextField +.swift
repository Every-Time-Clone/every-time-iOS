//
//  UITextField +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/05.
//

import UIKit

extension UITextField {
    
  func addLeftPadding() {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
      self.leftView = paddingView
      self.leftViewMode = ViewMode.always
  }
}
