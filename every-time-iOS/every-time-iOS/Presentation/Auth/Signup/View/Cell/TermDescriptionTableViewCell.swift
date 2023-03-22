//
//  TermsDescriptionTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/15.
//

import UIKit

import SnapKit
import Then

final class TermDescriptionTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let descriptionTextView: UITextView = UITextView()

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

extension TermDescriptionTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        descriptionTextView.do {
            $0.backgroundColor = UIColor(r: 249, g: 248, b: 249)
            $0.layer.borderColor = UIColor.systemGray5.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 8
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubview(descriptionTextView)
        
        descriptionTextView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
        }
    }
}
