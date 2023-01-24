//
//  BoardPreviewTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/24.
//

import UIKit

import SnapKit
import Then

final class BoardPreviewTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let boardTitleLabel: UILabel = UILabel()
    private let contentTitleLabel: UILabel = UILabel()
    
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

extension BoardPreviewTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        boardTitleLabel.do {
            $0.text = "자유게시판"
            $0.font = .systemFont(ofSize: 13, weight: .semibold)
        }
        
        contentTitleLabel.do {
            $0.text = "공기업 티오 줄어드는 거 언제까지 갈까요...?"
            $0.font = .systemFont(ofSize: 12)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(boardTitleLabel, contentTitleLabel)
        
        boardTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        contentTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(boardTitleLabel)
            $0.leading.equalTo(boardTitleLabel.snp.trailing).offset(15)
        }
    }
}
