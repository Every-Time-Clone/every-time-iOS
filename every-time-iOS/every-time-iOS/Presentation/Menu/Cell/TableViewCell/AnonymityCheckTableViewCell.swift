//
//  AnonymityCheckTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/23.
//

import UIKit

import SnapKit
import Then

final class AnonymityCheckTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let containerView: UIView = UIView()
    private let anonymityLabel: UILabel = UILabel()
    private let toggleButton: UISwitch = UISwitch()

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

extension AnonymityCheckTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        selectionStyle = .none
        
        contentView.backgroundColor = .clear
        
        containerView.do {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.systemGray5.cgColor
            $0.layer.cornerRadius = 10
        }
        
        anonymityLabel.do {
            $0.font = .systemFont(ofSize: 16)
            $0.text = "익명 허용"
        }
        
        toggleButton.do {
            $0.onTintColor = .everytimeRed
            $0.isOn = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubview(containerView)
        containerView.addSubviews(anonymityLabel, toggleButton)
        
        containerView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(60)
            $0.centerY.equalToSuperview()
        }
        
        anonymityLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        
        toggleButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
}
