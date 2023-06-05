//
//  InfoTextField.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/05/21.
//

import UIKit

import SnapKit
import Then

class InfoTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoTextField {
    
    // MARK: - Custom Methods
    
    private func setUI() {
        backgroundColor = UIColor(r: 249, g: 249, b: 248)
        layer.cornerRadius = 10
        layer.borderColor = UIColor.systemGray5.cgColor
        layer.borderWidth = 1
        tintColor = .black
        addLeftPadding(width: 10)
    }
}
