//
//  TitleView.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/31.
//

import UIKit

class TitleView: UIStackView {
    
    // MARK: - Properties

    private let boardTitleLabel = UILabel()
    private let campusNameLabel = UILabel()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TitleView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        boardTitleLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textAlignment = .center
            $0.sizeToFit()
        }
        
        campusNameLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .darkGray
            $0.textAlignment = .center
            $0.sizeToFit()
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addArrangedSubviews(boardTitleLabel, campusNameLabel)
    }
    
    // MARK: - Methods
    
    func setNavigationBarTitle(_ boardTitle: String, _ campusName: String) {
        boardTitleLabel.text = boardTitle
        campusNameLabel.text = campusName
    }
}
