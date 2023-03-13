//
//  TermsViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/13.
//

import UIKit

import SnapKit
import Then

final class TermsViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let topView: UIView = UIView()
    private let topTitleLabel: UILabel = UILabel()
    private let closeButton: UIButton = UIButton()
    private let backButton: UIButton = UIButton()
    private let scrollView: UIScrollView = UIScrollView()
    private let titleLabel: UILabel = UILabel()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
}

extension TermsViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        topTitleLabel.do {
            $0.text = "회원가입"
            $0.font = .systemFont(ofSize: 17, weight: .semibold)
        }
        
        scrollView.do {
            $0.backgroundColor = .red
        }
        
        closeButton.do {
            $0.tintColor = .black
            $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        }
        
        backButton.do {
            $0.tintColor = .black
            $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        }
        
        titleLabel.do {
            $0.text = "약관 동의"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(topView, scrollView)
        topView.addSubviews(topTitleLabel, closeButton, backButton)
        scrollView.addSubviews(titleLabel)
        
        topView.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }

        closeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-15)
            $0.centerY.equalToSuperview()
        }
        
        topTitleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        dismiss(animated: false)
    }
}
