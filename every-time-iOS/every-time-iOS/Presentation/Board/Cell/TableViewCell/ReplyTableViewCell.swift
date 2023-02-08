//
//  ReplyTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/02.
//

import UIKit

import SnapKit
import Then

class ReplyTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let arrowImageView: UIImageView = UIImageView()
    private let replyBackgroundView: UIView = UIView()
    private let profileImageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    private let contentLabel: UILabel = UILabel()
    private let timeLabel: UILabel = UILabel()
    private let buttonView: UIView = UIView()
    private let likeButton: UIButton = UIButton()
    private let menuButton: UIButton = UIButton()
    private let lineView: UIView = UIView()
    
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

extension ReplyTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        selectionStyle = .none
        
        arrowImageView.do {
            $0.image = UIImage(systemName: "arrow.turn.down.right")
            $0.tintColor = .lightGray
        }
        
        replyBackgroundView.do {
            $0.backgroundColor = UIColor(r: 248, g: 249, b: 248)
            $0.layer.cornerRadius = 8
        }
        
        profileImageView.do {
            $0.backgroundColor = .systemGray4
            $0.layer.cornerRadius = 5
        }
        
        nameLabel.do {
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
        }
        
        contentLabel.do {
            $0.font = .systemFont(ofSize: 13)
            $0.numberOfLines = 0
        }
        
        timeLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .lightGray
        }
        
        buttonView.do {
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 5
        }
        
        likeButton.do {
            $0.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            $0.tintColor = .lightGray
        }
        
        menuButton.do {
            $0.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
            $0.tintColor = .lightGray
        }
        
        lineView.do {
            $0.backgroundColor = .lightGray
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(arrowImageView, replyBackgroundView)
        
        replyBackgroundView.addSubviews(profileImageView, nameLabel, contentLabel, timeLabel, buttonView)
        
        buttonView.addSubviews(likeButton, lineView, menuButton)
        
        arrowImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(20)
        }
        
        replyBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalTo(arrowImageView.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-5)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(25)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(5)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(5)
            $0.leading.equalTo(profileImageView)
            $0.centerX.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView)
            $0.top.equalTo(contentLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        buttonView.snp.makeConstraints {
            $0.top.equalTo(profileImageView)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(23)
            $0.width.equalTo(67)
        }
        
        likeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(13)
        }
        
        lineView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(likeButton.snp.trailing).offset(10)
            $0.width.equalTo(1)
            $0.height.equalTo(10)
        }
        
        menuButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(lineView.snp.trailing).offset(10)
            $0.width.height.equalTo(13)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(_ model: CommentModel) {
        nameLabel.text = model.name
        contentLabel.text = model.content
        timeLabel.text = model.time
    }
}
