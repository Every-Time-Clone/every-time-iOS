//
//  AuthDescriptionView.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/20.
//

import UIKit

import SnapKit
import Then

class AuthDescriptionView: UIView {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
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

extension AuthDescriptionView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        titleLabel.do {
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
            $0.textColor = .darkGray
        }
        
        descriptionLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .lightGray
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(titleLabel, descriptionLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func setAuthLabel(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
