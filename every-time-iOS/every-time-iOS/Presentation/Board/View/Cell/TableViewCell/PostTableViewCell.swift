//
//  PostTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/30.
//

import UIKit

import SnapKit
import Then

class PostTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let timeLabel = UILabel()
    private let nameLabel = UILabel()
    private let likeImageView = UIImageView()
    private let likeNumberLabel = UILabel()
    private let lineView = UIView()
    private let commentImageView = UIImageView()
    private let commentNumberLabel = UILabel()
    private let bottomLineView = UIView()
    
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

extension PostTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        selectionStyle = .none
        
        titleLabel.do {
            $0.text = "제목"
            $0.font = .systemFont(ofSize: 15)
        }
        
        contentLabel.do {
            $0.text = "내용"
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .darkGray
        }
        
        timeLabel.do {
            $0.text = "15분 전"
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .lightGray
        }
        
        lineView.do {
            $0.backgroundColor = .lightGray
        }
        
        nameLabel.do {
            $0.text = "익명"
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .lightGray
        }
        
        likeImageView.do {
            $0.image = UIImage(systemName: "hand.thumbsup")
            $0.tintColor = UIColor(r: 199, g: 39, b: 9)
        }
        
        likeNumberLabel.do {
            $0.text = "0"
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = UIColor(r: 199, g: 39, b: 9)
        }
        
        commentImageView.do {
            $0.image = UIImage(systemName: "bubble.left")
            $0.tintColor = UIColor(r: 33, g: 170, b: 180)
        }
        
        commentNumberLabel.do {
            $0.text = "0"
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = UIColor(r: 33, g: 170, b: 180)
        }
        
        bottomLineView.do {
            $0.backgroundColor = .systemGray6
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(titleLabel, contentLabel, timeLabel, lineView, nameLabel, commentNumberLabel, commentImageView, likeNumberLabel, likeImageView, bottomLineView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(3)
            $0.leading.equalTo(contentLabel)
        }
        
        lineView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(10)
            $0.centerY.equalTo(timeLabel)
            $0.leading.equalTo(timeLabel.snp.trailing).offset(5)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(timeLabel)
            $0.leading.equalTo(lineView.snp.trailing).offset(5)
        }
        
        commentNumberLabel.snp.makeConstraints {
            $0.centerY.equalTo(timeLabel)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        commentImageView.snp.makeConstraints {
            $0.centerY.equalTo(commentNumberLabel)
            $0.trailing.equalTo(commentNumberLabel.snp.leading).offset(-3)
            $0.width.height.equalTo(12)
        }
        
        likeNumberLabel.snp.makeConstraints {
            $0.centerY.equalTo(commentNumberLabel)
            $0.trailing.equalTo(commentImageView.snp.leading).offset(-5)
        }
        
        likeImageView.snp.makeConstraints {
            $0.centerY.equalTo(commentNumberLabel)
            $0.trailing.equalTo(likeNumberLabel.snp.leading).offset(-3)
            $0.width.height.equalTo(12)
        }
        
        bottomLineView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(_ model: PostModel) {
        titleLabel.text = model.title
        contentLabel.text = model.contents
        timeLabel.text = convertTimeStampToDate(model.time)
        likeNumberLabel.text = "\(model.goods)"
        commentNumberLabel.text = model.commentNumber
    }

    private func convertTimeStampToDate(_ timeStamp: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss" // 2020-08-13 16:30

        let convertDate = dateFormatter.date(from: timeStamp)

        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yy/MM/dd"
        myDateFormatter.locale = Locale(identifier:"ko_KR")

        let convertStr = myDateFormatter.string(from: convertDate!)
        return convertStr
    }
}
