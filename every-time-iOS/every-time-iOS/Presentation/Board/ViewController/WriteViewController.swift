//
//  WritingViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/08.
//

import UIKit

import SnapKit
import Then

class WriteViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()
    private let backButton: UIButton = UIButton()
    private let completeButton: UIButton = UIButton()
    private let titleTextField: UITextField = UITextField()
    private let lineView: UIView = UIView()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setAddTarget()
        setDelegate()
    }
}

extension WriteViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "글 쓰기"
            $0.font = .systemFont(ofSize: 17, weight: .semibold)
        }
        
        backButton.do {
            $0.setImage(UIImage(systemName: "xmark"), for: .normal)
            $0.tintColor = .black
        }
        
        completeButton.do {
            var attString = AttributedString("완료")
            attString.font = .systemFont(ofSize: 12, weight: .semibold)
            attString.foregroundColor = .white
            
            var configuration = UIButton.Configuration.plain()
            configuration.attributedTitle = attString
            
            $0.configuration = configuration
            $0.backgroundColor = .everytimeRed
            $0.layer.cornerRadius = 14
        }
        
        titleTextField.do {
            $0.placeholder = "제목"
            $0.font = .systemFont(ofSize: 17, weight: .bold)
            $0.tintColor = .everytimeRed
        }
        
        lineView.do {
            $0.backgroundColor = .systemGray5
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(titleView, titleTextField, lineView)
        
        titleView.addSubviews(titleLabel, backButton, completeButton)
        
        titleView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalToSuperview().offset(20)
        }
        
        completeButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(30)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(titleTextField)
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    
    private func setDelegate() {
        titleTextField.delegate = self
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        dismiss(animated: true)
    }
    
    @objc private func completeButtonDidTap() {
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension WriteViewController: UITextFieldDelegate {
    
    
}
