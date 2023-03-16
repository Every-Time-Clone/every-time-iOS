//
//  SchoolTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/12.
//

import UIKit

import SnapKit
import Then

final class SchoolTableViewCell: UITableViewCell {

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SchoolTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.backgroundColor = .black
    }
}
