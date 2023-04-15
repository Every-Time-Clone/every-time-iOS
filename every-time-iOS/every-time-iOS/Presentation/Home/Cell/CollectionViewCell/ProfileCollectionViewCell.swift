//
//  ProfileCollectionViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/04/15.
//

import UIKit

import SnapKit
import Then

final class ProfileCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .yellow
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
}
