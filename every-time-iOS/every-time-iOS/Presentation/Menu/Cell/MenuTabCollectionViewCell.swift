//
//  CollectionViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/12.
//

import UIKit

import SnapKit
import Then

class MenuTabCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    let menuNameLabel: UILabel = UILabel()
    private let lineView: UIView = UIView()
    
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

extension MenuTabCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        lineView.do {
            $0.backgroundColor = .black
        }
        
        menuNameLabel.do {
            $0.font = .systemFont(ofSize: 22, weight: .bold)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(menuNameLabel, lineView)
        
        lineView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(lineView.snp.top).offset(-3)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(_ menuName: String) {
        menuNameLabel.text = menuName
    }
}
