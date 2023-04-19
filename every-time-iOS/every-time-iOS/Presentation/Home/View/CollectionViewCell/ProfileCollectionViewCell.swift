//
//  ProfileCollectionViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/04/15.
//

import UIKit

import SnapKit
import Then

final class ProfileCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let containerView: UIView = UIView()
    private let profileImageView: UIImageView = UIImageView()
    private let idLabel: UILabel = UILabel()
    private let nameLabel: UILabel = UILabel()
    private let collegeInfoLabel: UILabel = UILabel()
    private let infoStackView: UIStackView = UIStackView()
    private let qrView: UIView = UIView()
    private let qrImageView: UIImageView = UIImageView()
    private let qrLabel: UILabel = UILabel()
    private let qrStackView: UIStackView = UIStackView()
    
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

extension ProfileCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .clear
        
        containerView.do {
            $0.layer.cornerRadius = 12
            $0.layer.borderColor = UIColor.everytimeGray.cgColor
            $0.layer.borderWidth = 2
        }
        
        profileImageView.do {
            $0.image = UIImage(systemName: "person.crop.square.fill")
            $0.tintColor = .everytimeGray
        }
        
        idLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .bold)
            $0.text = "rnrdl"
        }
        
        nameLabel.do {
            $0.font = .systemFont(ofSize: 13)
            $0.textColor = .lightGray
            $0.text = "김민 / 닉네임닉네임"
        }
        
        collegeInfoLabel.do {
            $0.font = .systemFont(ofSize: 13)
            $0.textColor = .lightGray
            $0.text = "동국대 서울캠 20학번"
        }
        
        infoStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
        }
        
        qrView.do {
            $0.backgroundColor = .everytimeGray
            $0.layer.cornerRadius = 10
        }
        
        qrImageView.do {
            $0.image = UIImage(systemName: "qrcode.viewfinder")
            $0.tintColor = .black
        }
        
        qrLabel.do {
            $0.font = .systemFont(ofSize: 12, weight: .light)
            $0.text = "QR 인증"
        }
        
        qrStackView.do {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 3
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubview(containerView)
        containerView.addSubviews(profileImageView, infoStackView, qrView)
        infoStackView.addArrangedSubviews(idLabel, nameLabel, collegeInfoLabel)
        qrStackView.addArrangedSubviews(qrImageView, qrLabel)
        qrView.addSubviews(qrStackView)
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.bottom.trailing.equalToSuperview().offset(-5)
        }
        
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(60)
        }
        
        infoStackView.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
        }
        
        qrView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(60)
        }
        
        qrStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        qrImageView.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }
    }
}
