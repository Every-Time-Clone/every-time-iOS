//
//  BoardSearchCollectionViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/22.
//

import UIKit

import SnapKit
import Then

final class BoardSearchCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let searchView: UIView = UIView()
    private let searchLabel: UILabel = UILabel()
    private let searchImageView: UIImageView = UIImageView()
    
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

extension BoardSearchCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        searchView.do {
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 8
        }
        
        searchLabel.do {
            $0.text = "다른 게시판을 검색해 보세요"
            $0.textColor = .lightGray
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
        }
        
        searchImageView.do {
            $0.image = UIImage(systemName: "magnifyingglass")
            $0.tintColor = .lightGray
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(searchView)
        searchView.addSubviews(searchLabel, searchImageView)
        
        searchView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        searchLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        
        searchImageView.snp.makeConstraints {
            $0.centerY.equalTo(searchLabel)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.height.equalTo(20)
        }
    }
}
