//
//  BoardSearchTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/22.
//

import UIKit

import SnapKit
import Then

final class BoardSearchTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let boardStackView: UIStackView = UIStackView()
    private let boardNameStackView: UIStackView = UIStackView()
    private let boardNameLabel: UILabel = UILabel()
    private let boardDetailLabel: UILabel = UILabel()
    private let updateImageView: UIImageView = UIImageView()
    
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

extension BoardSearchTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .white
        
        boardNameLabel.do {
            $0.font = .systemFont(ofSize: 17, weight: .bold)
        }
        
        boardDetailLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .darkGray
            $0.numberOfLines = 0
        }
        
        boardStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = CGFloat(3)
        }
        
        boardNameStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.spacing = CGFloat(5)
        }
        
        updateImageView.do {
            $0.image = UIImage(named: "UpdateImage")
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(boardStackView)
        
        boardNameStackView.addArrangedSubViews(boardNameLabel, updateImageView)
        boardStackView.addArrangedSubViews(boardNameStackView,boardDetailLabel)
        
        updateImageView.snp.makeConstraints {
            $0.width.height.equalTo(15)
        }
        
        boardNameStackView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        boardStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(_ model: BoardSearchModel) {
        boardNameLabel.text = model.boardName
        boardDetailLabel.text = model.boardDetail
        
        if model.isUpdated { updateImageView.isHidden = false }
    }
}
