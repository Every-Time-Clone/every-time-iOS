//
//  PostTableViewHeader.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/02.
//

import UIKit

import SnapKit
import Then

protocol PostTableViewHeaderDelegate {
    func scrapButtonDidTap(_ scrapButtonState: ScrapButtonType)
}

enum ScrapButtonType {
    case scrapped
    case notScrapped
}

class PostTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    private let profileImageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    private let timeLabel: UILabel = UILabel()
    private let titleLabel: UILabel = UILabel()
    private let contentLabel: UILabel = UILabel()
    private let likeImageView: UIImageView = UIImageView()
    private let likeNumberLabel: UILabel = UILabel()
    private let commentImageView: UIImageView = UIImageView()
    private let commentNumberLabel: UILabel = UILabel()
    private let scrapImageView: UIImageView = UIImageView()
    private let scrapNumberLabel: UILabel = UILabel()
    private let likeButton: UIButton = UIButton()
    private let scrapButton: UIButton = UIButton()
    
    // MARK: - Properties
    
    var scrapButtonState: ScrapButtonType = .notScrapped
    var delegate: PostTableViewHeaderDelegate?
    
    // MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostTableViewHeader {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        profileImageView.do {
            $0.backgroundColor = .systemGray4
            $0.layer.cornerRadius = 7
        }
        
        nameLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
        }
        
        timeLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .lightGray
        }
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 17,weight: .semibold)
            $0.numberOfLines = 0
        }
        
        contentLabel.do {
            $0.font = .systemFont(ofSize: 13)
            $0.numberOfLines = 0
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
        
        scrapImageView.do {
            $0.image = UIImage(systemName: "star")
            $0.tintColor = UIColor(r: 255, g: 212, b: 93)
        }
        
        scrapNumberLabel.do {
            $0.text = "0"
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = UIColor(r: 255, g: 212, b: 93)
        }
        
        likeButton.setPostDetailButton("공감", "hand.thumbsup")
//
        scrapButton.setPostDetailButton("스크랩", "star")
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(profileImageView, nameLabel, timeLabel, titleLabel, contentLabel, likeImageView, likeNumberLabel, commentImageView, commentNumberLabel, scrapImageView, scrapNumberLabel, likeButton, scrapButton)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(35)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(5)
        }

        timeLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalTo(nameLabel)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(5)
            $0.leading.equalTo(profileImageView)
            $0.centerX.equalToSuperview()
        }

        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(profileImageView)
            $0.centerX.equalToSuperview()
//            $0.bottom.equalToSuperview().offset(-10)
        }

        likeImageView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(15)
            $0.leading.equalTo(profileImageView)
            $0.width.height.equalTo(13)
        }

        likeNumberLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeImageView)
            $0.leading.equalTo(likeImageView.snp.trailing).offset(3)
        }

        commentImageView.snp.makeConstraints {
            $0.centerY.equalTo(likeImageView)
            $0.leading.equalTo(likeNumberLabel.snp.trailing).offset(5)
            $0.width.height.equalTo(13)
        }

        commentNumberLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeImageView)
            $0.leading.equalTo(commentImageView.snp.trailing).offset(3)
        }

        scrapImageView.snp.makeConstraints {
            $0.centerY.equalTo(likeImageView)
            $0.leading.equalTo(commentNumberLabel.snp.trailing).offset(5)
            $0.width.height.equalTo(13)
        }

        scrapNumberLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeImageView)
            $0.leading.equalTo(scrapImageView.snp.trailing).offset(3)
        }

        scrapButton.snp.makeConstraints {
            $0.centerY.equalTo(likeButton)
            $0.leading.equalTo(likeButton.snp.trailing).offset(5)
        }

        likeButton.snp.makeConstraints {
            $0.top.equalTo(likeImageView.snp.bottom).offset(5)
            $0.leading.equalTo(profileImageView)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(_ model: PostModel) {
        nameLabel.text = model.user.nickname
        titleLabel.text = model.title
        contentLabel.text = model.contents
        timeLabel.text = model.time.convertTimeStampToDate()
        likeNumberLabel.text = "\(model.goods)"
        commentNumberLabel.text = model.commentNumber
        scrapNumberLabel.text = model.scrapNumber
        
        if model.isScrapped { // 스크랩되었을 때
            scrapButtonState = .scrapped
            scrapButton.setPostDetailButton("스크랩 취소", "")
        }
    }
    
    private func setAddTarget() {
        scrapButton.addTarget(self, action: #selector(scrapButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
   @objc private func scrapButtonDidTap() {
       delegate?.scrapButtonDidTap(scrapButtonState)
       
       switch scrapButtonState {
       case .scrapped:
           scrapButtonState = .notScrapped
       case .notScrapped:
           scrapButtonState = .scrapped
       }
   }
}
