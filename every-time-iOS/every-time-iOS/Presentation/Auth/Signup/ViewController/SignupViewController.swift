//
//  SignupViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/19.
//

import UIKit

import SnapKit
import Then

final class SignupViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let topView: UIView = UIView()
    private let topTitleLabel: UILabel = UILabel()
    private let closeButton: UIButton = UIButton()
    private let backButton: UIButton = UIButton()
    private let titleLabel: UILabel = UILabel()
    private let idTextField: UITextField = AuthTextField()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setAddTarget()
    }
}

extension SignupViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        topTitleLabel.do {
            $0.text = "회원 가입"
            $0.font = .systemFont(ofSize: 17, weight: .semibold)
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
            $0.text = "회원 정보"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(topView, titleLabel, idTextField)
        topView.addSubviews(topTitleLabel, closeButton, backButton)

        topView.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
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
            $0.top.equalTo(topView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        dismiss(animated: false)
    }
    
    @objc private func closeButtonDidTap() {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
}
