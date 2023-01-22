//
//  EventCollectionViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/23.
//

import UIKit

import SnapKit
import Then

final class EventCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let eventImageView: UIImageView = UIImageView()
    private let eventLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    
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

extension EventCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 15
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        contentView.layer.borderWidth = 1
        
        eventImageView.do {
            $0.backgroundColor = .lightGray
        }
        
        eventLabel.do {
            $0.text = "수강신청 안 망하는 법"
            $0.font = .systemFont(ofSize: 17, weight: .bold)
        }
        
        descriptionLabel.do {
            $0.text = "경쟁률 낮은 과목 찾기 등"
            $0.textColor = .orange
            $0.font = .systemFont(ofSize: 12)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(eventImageView, eventLabel, descriptionLabel)
        
        eventImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(15)
            $0.width.height.equalTo(20)
        }
        
        eventLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalTo(eventImageView.snp.trailing).offset(10)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(eventLabel.snp.bottom).offset(1)
            $0.leading.equalTo(eventLabel)
        }
    }
}
