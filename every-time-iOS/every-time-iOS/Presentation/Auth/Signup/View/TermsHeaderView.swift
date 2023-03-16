//
//  TermsHeaderView.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/17.
//

import UIKit

import SnapKit
import Then

class TermsHeaderView: UIView {
    
    // MARK: - UI Components
    
    private let termLabel: UILabel = UILabel()
    
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

extension TermsHeaderView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        termLabel.do {
            $0.text = "약관 동의"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubview(termLabel)
        
        termLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
    }
}
