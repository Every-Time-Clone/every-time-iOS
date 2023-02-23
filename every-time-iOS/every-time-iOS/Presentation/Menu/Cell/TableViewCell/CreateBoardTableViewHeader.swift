//
//  CreateBoardTableViewHeader.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/23.
//

import UIKit

import SnapKit
import Then

class CreateBoardTableViewHeader: UIView {
    
    // MARK: - UI Components
    
    private let titleTextField: UITextField = UITextField()
    private let titleLineView: UIView = UIView()
    private let detailTextField: UITextField = UITextField()
    private let detailLineView: UIView = UIView()
    
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

extension CreateBoardTableViewHeader {
    
    // MARK: - UI Components
    
    private func setUI() {
        backgroundColor = .clear
        
        titleTextField.do {
            $0.placeholder = "이름"
            $0.tintColor = .everytimeRed
            $0.font = .systemFont(ofSize: 17, weight: .bold)
        }
        
        titleLineView.do {
            $0.backgroundColor = .systemGray5
        }
        
        detailTextField.do {
            $0.placeholder = "설명"
            $0.tintColor = .everytimeRed
            $0.font = .systemFont(ofSize: 16)
        }
        
        detailLineView.do {
            $0.backgroundColor = .systemGray5
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(titleTextField, titleLineView, detailTextField, detailLineView)
        
        titleTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
        }
        
        titleLineView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom)
            $0.width.equalTo(titleTextField)
            $0.centerX.equalTo(titleTextField)
            $0.height.equalTo(1)
        }
        
        detailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLineView.snp.bottom).offset(5)
            $0.width.equalTo(titleTextField)
            $0.centerX.equalTo(titleTextField)
            $0.height.equalTo(50)
        }
        
        detailLineView.snp.makeConstraints {
            $0.top.equalTo(detailTextField.snp.bottom)
            $0.width.equalTo(detailTextField)
            $0.centerX.equalTo(detailTextField)
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
}
