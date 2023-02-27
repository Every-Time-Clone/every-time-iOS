//
//  LoginViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/27.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let everyTimeImageView: UIImageView = UIImageView()
    private let descriptionLabel: UILabel = UILabel()
    private let everyTimeLabel: UILabel = UILabel()
    private let idTextField: UITextField = UITextField()
    private let passwordTextField: UITextField = UITextField()
    private let loginButton: UIButton = UIButton()
    private let loginStackView: UIStackView = UIStackView()

    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setDelegate()
    }
}

extension LoginViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        everyTimeImageView.image = UIImage(named: "EveryTimeMain")
        
        descriptionLabel.do {
            $0.text = "대학 생활을 더 편하고 즐겁게"
            $0.textColor = .lightGray
            $0.font = .systemFont(ofSize: 15)
        }
        
        everyTimeLabel.do {
            $0.text = "에브리타임"
            $0.textColor = .everytimeRed
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        idTextField.do {
            $0.backgroundColor = .yellow
            $0.placeholder = "아이디"
        }
        
        passwordTextField.do {
            $0.backgroundColor = .yellow
            $0.placeholder = "비밀번호"
        }
        
        loginButton.do {
            $0.backgroundColor = .everytimeRed
            $0.setTitle("에브리타임 로그인", for: .normal)
        }
        
        loginStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.backgroundColor = .cyan
            $0.spacing = CGFloat(5)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(everyTimeImageView, descriptionLabel, everyTimeLabel, loginStackView)
        
        loginStackView.addArrangedSubviews(idTextField, passwordTextField, loginButton)
        
        everyTimeImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(50)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(everyTimeImageView.snp.bottom).offset(7)
            $0.centerX.equalTo(everyTimeImageView)
        }
        
        everyTimeLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(3)
            $0.centerX.equalTo(descriptionLabel)
        }
        
        loginStackView.snp.makeConstraints {
            $0.top.equalTo(everyTimeLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
    }

    // MARK: - Methods
    
    private func setDelegate() {
        idTextField.delegate = self
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        everyTimeImageView.isHidden = true
        descriptionLabel.isHidden = true
        everyTimeLabel.isHidden = true
        
        UIView.animate(withDuration: 0.25) {
            self.loginStackView.snp.updateConstraints {
                $0.top.equalTo(self.everyTimeLabel.snp.bottom).offset(-100)
            }
            self.loginStackView.superview?.layoutIfNeeded()
        }
    }
}
