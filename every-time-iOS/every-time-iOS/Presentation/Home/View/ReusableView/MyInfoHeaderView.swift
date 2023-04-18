//
//  MyInfoHeaderView.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/04/15.
//

import UIKit

import SnapKit
import Then

final class MyInfoHeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "MyInfoHeaderView"
    
    // MARK: - UI Components
    
    private let borderView: UIView = UIView()
    private let lineView: UIView = UIView()
    private let categoryLabel: UILabel = UILabel()
        
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

extension MyInfoHeaderView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .clear
    
        borderView.do {
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            $0.layer.cornerRadius = 12
            $0.layer.borderColor = UIColor.everytimeGray.cgColor
            $0.layer.borderWidth = 2
            $0.layer.masksToBounds = true
        }
        
        lineView.do {
            $0.backgroundColor = .white
        }
        
        categoryLabel.do {
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.text = "테스트"
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(borderView, lineView)
        borderView.addSubview(categoryLabel)
        
        borderView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.bottom.equalToSuperview() 
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.trailing.equalTo(borderView)
            $0.height.equalTo(2)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
    }
}
