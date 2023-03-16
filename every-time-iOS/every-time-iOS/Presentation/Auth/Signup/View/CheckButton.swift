//
//  CheckButton.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/13.
//

import UIKit

import SnapKit
import Then

final class CheckButton: UIButton {
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CheckButton {
    
    // MARK: - Methods
    
    private func setButton() {
        self.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        self.setImage(UIImage(systemName: "square"), for: .normal)
    }
}
