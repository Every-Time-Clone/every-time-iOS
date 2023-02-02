//
//  PostTableViewHeader.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/02.
//

import UIKit

import SnapKit
import Then

class PostTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    private let testLabel: UILabel = UILabel()
    
    // MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostTableViewHeader {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .cyan
        
        testLabel.do {
            $0.text = "xㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋxㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋxㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"
            $0.numberOfLines = 0
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubview(testLabel)
        
        testLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.top.equalToSuperview().offset(20)
        }
    }
    
}
