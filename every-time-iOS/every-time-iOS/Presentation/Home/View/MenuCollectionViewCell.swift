//
//  MenuCollectionViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/23.
//

import UIKit

import SnapKit
import Then

final class MenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let menuImageView: UIImageView = UIImageView()
    private let menuNameLabel: UILabel = UILabel()
    
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

extension MenuCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        menuImageView.do {
            $0.backgroundColor = .systemGray5
        }
        
        menuNameLabel.do {
            $0.text = "학교\n홈"
            $0.font = .systemFont(ofSize: 12)
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(menuImageView, menuNameLabel)
        
        menuImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(menuImageView.snp.width)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.top.equalTo(menuImageView.snp.bottom).offset(3)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(_ model: MenuModel) {
        menuImageView.image = UIImage(named: model.menuImage)
        menuNameLabel.text = model.menuName
    }
}
