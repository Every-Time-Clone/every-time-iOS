//
//  TermsTitleTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/15.
//

import UIKit

import SnapKit
import Then

final class TermTitleTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let checkBoxImageView: UIImageView = UIImageView()
    private let termTitleLabel: UILabel = UILabel()

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

extension TermTitleTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .white
        
        checkBoxImageView.do {
            $0.image = UIImage(systemName: "square")
            $0.tintColor = .lightGray
        }
        
        termTitleLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .darkGray
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(checkBoxImageView, termTitleLabel)
        
        checkBoxImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(15)
        }
        
        termTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(checkBoxImageView.snp.trailing).offset(5)
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(title: String) {
        termTitleLabel.text = title
    }
}
