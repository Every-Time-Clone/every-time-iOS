//
//  BoardTableViewHeader.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/30.
//

import UIKit

import SnapKit
import Then

class BoardTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    private let bannerImageView = UIImageView()
    
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

extension BoardTableViewHeader {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        bannerImageView.do {
            $0.backgroundColor = .cyan
            $0.layer.cornerRadius = 8
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(7)
            $0.bottom.trailing.equalToSuperview().offset(-5)
        }
    }
}
