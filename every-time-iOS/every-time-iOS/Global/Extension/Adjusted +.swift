//
//  CGFloat +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/16.
//

import UIKit

extension CGFloat {
    
    var adjusted: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 375
        let ratioH: CGFloat = UIScreen.main.bounds.height / 667
        return ratio <= ratioH ? self * ratio : self * ratioH
    }
}

extension Double {
    
     var adjusted: Double {
         let ratio: Double = Double(UIScreen.main.bounds.width) / 375
         let ratioH: Double = Double(UIScreen.main.bounds.height) / 667
         return ratio <= ratioH ? self * ratio : self * ratioH
     }
 }

extension Int {
    
     var adjusted: Int {
         let ratio: Int = Int(UIScreen.main.bounds.width) / 375
         let ratioH: Int = Int(UIScreen.main.bounds.height) / 667
         return ratio <= ratioH ? self * ratio : self * ratioH
     }
 }
