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
    private let defaultOptionStackView: UIStackView = UIStackView()
    private let defaultOptionLabel: UILabel = UILabel()
    private let defaultOptionDetailLabel: UILabel = UILabel()
    private let defaultOptionCheckImage: UIImageView = UIImageView()
    private let photoOptionLabel: UILabel = UILabel()
    private let photoOptionDetailLabel: UILabel = UILabel()
    private let photoOptionCheckImage: UIImageView = UIImageView()
    private let photoOptionStackView: UIStackView = UIStackView()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
        setTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BoardOptionTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        selectionStyle = .none
        
        contentView.backgroundColor = .clear
        
        containerView.do {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.systemGray5.cgColor
            $0.layer.cornerRadius = 10
        }
        
        optionStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
        }
        
        defaultOptionLabel.do { 
            $0.font = .systemFont(ofSize: 15)
            $0.text = "기본형"
        }
        
        defaultOptionDetailLabel.do {
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = .lightGray
            $0.text = "여러 글을 빠르게 읽을 수 있는 기본 형식"
        }
        
        defaultOptionStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillProportionally
            $0.spacing = CGFloat(5)
        }
        
        photoOptionLabel.do {
            $0.font = .systemFont(ofSize: 15)
            $0.text = "사진형"
        }
        
        photoOptionDetailLabel.do {
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = .lightGray
            $0.text = "글 목록에 사진이 노출되는 형식"
        }
        
        photoOptionStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillProportionally
            $0.spacing = CGFloat(5)
        }
        
        defaultOptionCheckImage.do {
            $0.image = UIImage(systemName: "checkmark")
            $0.tintColor = .everytimeRed
        }
        
        photoOptionCheckImage.do {
            $0.image = UIImage(systemName: "checkmark")
            $0.tintColor = .everytimeRed
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubview(containerView)
        containerView.addSubview(optionStackView)
        optionStackView.addArrangedSubviews(defaultOptionView, photoOptionView)
        defaultOptionStackView.addArrangedSubviews(defaultOptionLabel, defaultOptionDetailLabel)
        defaultOptionView.addSubviews(defaultOptionStackView, defaultOptionCheckImage)
        photoOptionStackView.addArrangedSubviews(photoOptionLabel, photoOptionDetailLabel)
        photoOptionView.addSubviews(photoOptionStackView, photoOptionCheckImage)
        
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
        
        defaultOptionStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        photoOptionStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        defaultOptionCheckImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-15)
            $0.width.height.equalTo(15)
        }
        
        photoOptionCheckImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-15)
            $0.width.height.equalTo(15)
        }
    }
    
    // MARK: - Methods
    
    private func setTapGesture() {
        defaultOptionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(defaultOptionDidTap)))
        photoOptionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(photoOptionDidTap)))
    }
    
    // MARK: - @objc Methods
    
    @objc private func defaultOptionDidTap() {
        defaultOptionCheckImage.isHidden = false
        photoOptionCheckImage.isHidden = true
    }
    
    @objc private func photoOptionDidTap() {
        defaultOptionCheckImage.isHidden = true
        photoOptionCheckImage.isHidden = false
    }
}
