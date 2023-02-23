//
//  BoardOptionTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/23.
//

import UIKit

import SnapKit
import Then

final class BoardOptionTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let containerView: UIView = UIView()
    private let defaultOptionView: UIView = UIView()
    private let photoOptionView: UIView = UIView()
    private let optionStackView: UIStackView = UIStackView()
    
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

extension BoardOptionTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        containerView.do {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.systemGray5.cgColor
            $0.layer.cornerRadius = 10
        }
        
        defaultOptionView.do {
            $0.backgroundColor = .black
        }
        
        photoOptionView.do {
            $0.backgroundColor = .cyan
        }
        
        optionStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubview(containerView)
        containerView.addSubview(optionStackView)
        optionStackView.addArrangedSubviews(defaultOptionView, photoOptionView)
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalTo(130)
            $0.bottom.equalToSuperview().offset(-5)
        }
        
        optionStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
