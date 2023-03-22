//
//  SchoolTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/12.
//

import UIKit

import SnapKit
import Then

final class SchoolTableViewCell: UITableViewCell {

    // MARK: - UI Components
    
    private let schoolLabel: UILabel = UILabel()
    
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

extension SchoolTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        schoolLabel.do {
            $0.text = "동국대학교"
            $0.font = .systemFont(ofSize: 15)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(schoolLabel)
        
        schoolLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
    }
}
