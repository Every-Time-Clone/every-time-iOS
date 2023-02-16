//
//  PinDetailTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

import UIKit

import SnapKit
import Then

protocol PinDetailTableViewCellDelegate {
    func pinButtonisSelected()
}

final class PinDetailTableViewCell: UITableViewCell {

    // MARK: - UI Components
    
    private let pinButton: UIButton = UIButton()
    private let menuNameLabel: UILabel = UILabel()
    private let updatedImageView: UIImageView = UIImageView()
    
    // MARK: - Properties
    
//    /var delegate: PinDetailTableViewCellDelegate?

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
            $0.setImage(UIImage(systemName: "pin"), for: .normal)
            $0.tintColor = .darkGray
        }
        
        menuNameLabel.do {
            $0.font = .systemFont(ofSize: 15)
            $0.text = "내가 쓴 글"
        }
        
        updatedImageView.do {
            $0.image = UIImage(systemName: "plus.circle")
            $0.tintColor = .everytimeRed
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(pinButton, menuNameLabel, updatedImageView)
        
        pinButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.width.height.equalTo(30)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(pinButton)
            $0.leading.equalTo(pinButton.snp.trailing).offset(20)
        }
        
        updatedImageView.snp.makeConstraints {
            $0.centerY.equalTo(pinButton)
            $0.leading.equalTo(menuNameLabel.snp.trailing).offset(5)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(_ model: PinMenuModel) {
        menuNameLabel.text = model.menuName
        
        if model.isPinned {
            pinButton.isSelected = true
            pinButton.tintColor = .darkGray
        } else {
            pinButton.isSelected = false
            pinButton.tintColor = .systemGray5
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
//        delegate?.pinButtonisSelected()
        if pinButton.isSelected {
            pinButton.tintColor = .darkGray
            pinButton.isSelected = false
        } else {
            pinButton.tintColor = .systemGray5
            pinButton.isSelected = true
        }
    }
}
