//
//  InfoMenuCollectionViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/04/15.
//

import UIKit

import SnapKit
import Then

final class InfoMenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components Property
    
    private let leftBorderLineView: UIView = UIView()
    private let menuNameLabel: UILabel = UILabel()
    private let rightBorderLineView: UIView = UIView()
    
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

extension InfoMenuCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .clear
        
        leftBorderLineView.do {
            $0.backgroundColor = .everytimeGray
        }
    
        menuNameLabel.do {
            $0.font = .systemFont(ofSize: 15)
            $0.text = "메뉴"
        }
        
        rightBorderLineView.do {
            $0.backgroundColor = .everytimeGray
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(leftBorderLineView, rightBorderLineView, menuNameLabel)
        
        leftBorderLineView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(5)
            $0.width.equalTo(2)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(leftBorderLineView.snp.trailing).offset(15)
        }
        
        rightBorderLineView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-5)
            $0.width.equalTo(2)
        }
    }
}
