//
//  PinDetailTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

import UIKit

import SnapKit
import Then

final class PinDetailTableViewCell: UITableViewCell {

    // MARK: - UI Components
    
    private let pinButton: UIButton = UIButton()
    private let menuNameLabel: UILabel = UILabel()
    private let updatedImageView: UIImageView = UIImageView()

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PinDetailTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        selectionStyle = .none
        
        contentView.backgroundColor = .clear
        
        pinButton.do {
            $0.setImage(UIImage(named: "PinnedImage"), for: .normal)
            $0.tintColor = .darkGray
        }
        
        menuNameLabel.do {
            $0.font = .systemFont(ofSize: 16)
        }
        
        updatedImageView.do {
            $0.image = UIImage(named: "UpdateImage")
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(pinButton, menuNameLabel, updatedImageView)
        
        pinButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.width.height.equalTo(25)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(pinButton)
            $0.leading.equalTo(pinButton.snp.trailing).offset(20)
        }
        
        updatedImageView.snp.makeConstraints {
            $0.centerY.equalTo(pinButton)
            $0.leading.equalTo(menuNameLabel.snp.trailing).offset(5)
            $0.width.height.equalTo(15)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(_ model: PinMenuModel) {
        menuNameLabel.text = model.menuName
        
        if model.isPinned {
            pinButton.isSelected = true
            pinButton.setImage(UIImage(named: "PinnedImage"), for: .normal)
        } else {
            pinButton.isSelected = false
            pinButton.setImage(UIImage(named: "UnpinnedImage"), for: .normal)
        }
        
        if !model.isUpdated {
            updatedImageView.isHidden = true
        }
    }
    
    private func setAddTarget() {
        pinButton.addTarget(self, action: #selector(pinButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc private func pinButtonDidTap() {
        if pinButton.isSelected {
            pinButton.setImage(UIImage(named: "PinnedImage"), for: .normal)
            pinButton.isSelected = false
        } else {
            pinButton.setImage(UIImage(named: "UnpinnedImage"), for: .normal)
            pinButton.isSelected = true
        }
    }
}
