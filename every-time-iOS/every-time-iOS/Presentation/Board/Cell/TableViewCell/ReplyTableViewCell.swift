//
//  ReplyTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/02.
//

import UIKit

class ReplyTableViewCell: UITableViewCell {
    
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

extension ReplyTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .green
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
}
