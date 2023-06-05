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
    private let findAccountButton: UIButton = UIButton()
    private let signupButton: UIButton = UIButton()

    // MARK: - Properties

    private let loginManager: LoginManager = LoginManager()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setDelegate()
        setAddTarget()


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
            $0.backgroundColor = .systemGray6
            $0.tintColor = .everytimeRed
            $0.addLeftPadding(width: CGFloat(10))
            $0.layer.cornerRadius = 17
            $0.font = .systemFont(ofSize: 13)
            var attString = AttributedString("아이디")
            attString.font = .systemFont(ofSize: 13)
            $0.attributedPlaceholder = NSAttributedString(attString)
        }
        
        passwordTextField.do {
            $0.backgroundColor = .systemGray6
            $0.tintColor = .everytimeRed
            $0.addLeftPadding(width: CGFloat(10))
            $0.layer.cornerRadius = 17
            $0.font = .systemFont(ofSize: 13)
            var attString = AttributedString("비밀번호")
            attString.font = .systemFont(ofSize: 13)
            $0.attributedPlaceholder = NSAttributedString(attString)
        }
        
        loginButton.do {
            $0.backgroundColor = .everytimeRed
            $0.layer.cornerRadius = 17
            var attString = AttributedString("에브리타임 로그인")
            attString.font = .systemFont(ofSize: 14, weight: .bold)
            attString.foregroundColor = .white
            var configuartion = UIButton.Configuration.plain()
            configuartion.attributedTitle = attString
            $0.configuration = configuartion
        }
        
        loginStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.spacing = CGFloat(5)
        }
        
        findAccountButton.do {
            var attString = AttributedString("아이디/비밀번호 찾기")
            attString.font = .systemFont(ofSize: 13)
            attString.foregroundColor = .lightGray
            var configuration = UIButton.Configuration.plain()
            configuration.attributedTitle = attString
            $0.configuration = configuration
        }
        
        signupButton.do {
            var attString = AttributedString("회원가입")
            attString.font = .systemFont(ofSize: 14, weight: .bold)
            attString.foregroundColor = .black
            var configuration = UIButton.Configuration.plain()
            configuration.attributedTitle = attString
            $0.configuration = configuration
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(everyTimeImageView, descriptionLabel, everyTimeLabel, loginStackView, findAccountButton, signupButton)
        
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
            $0.height.equalTo(120)
        }
        
        findAccountButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginStackView.snp.bottom).offset(15)
        }
        
        signupButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(findAccountButton.snp.bottom).offset(10)
        }
    }

    // MARK: - Methods
    
    private func setDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        setOriginalLoginStackAnimation()
    }
    
    private func setAddTarget() {
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        findAccountButton.addTarget(self, action: #selector(findAccountButtonDidTap), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupButtonDidTap), for: .touchUpInside)
    }
    
    private func setOriginalLoginStackAnimation() {
        everyTimeImageView.isHidden = false
        descriptionLabel.isHidden = false
        everyTimeLabel.isHidden = false
        UIView.animate(withDuration: 0.25) {
            self.loginStackView.snp.updateConstraints {
                $0.top.equalTo(self.everyTimeLabel.snp.bottom).offset(50)
            }
            self.loginStackView.superview?.layoutIfNeeded()
        }
    }

    private func presentTabBar() {
        let tabBar = EverytimeTabBarController()
        tabBar.modalTransitionStyle = .crossDissolve
        tabBar.modalPresentationStyle = .overFullScreen
        self.present(tabBar, animated: true)
    }

    private func presentLoginErrorAlert() {
        idTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        setOriginalLoginStackAnimation()
        let alert = UIAlertController(title: "올바른 정보를 입력해주세요.\nPC에서는 정상적으로 로그인이 되지만 앱에서 로그인이 되지 않을 경우,\n[everytimekr.help@gmail.com] 메일로 아이디와 스크린샷을 보내주시기 바랍니다.", message: nil, preferredStyle: .alert)
        let closeButton = UIAlertAction(title: "닫기", style: .cancel)
        alert.addAction(closeButton)
        present(alert, animated: true) {
            self.idTextField.text = ""
            self.passwordTextField.text = ""
        }
    }
    
    // MARK: - @objc Methods
    
    @objc private func loginButtonDidTap() {
        guard let email = idTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        let loginModel = LoginRequest(email: email, password: password)
        loginManager.request(parameters: loginModel) { [weak self] response in
            if response {
                self?.presentTabBar()
            } else {
                self?.presentLoginErrorAlert()
            }
        }
    }
    
    @objc private func findAccountButtonDidTap() {
        print("아이디/비밀번호 찾기")
    }
    
    @objc private func signupButtonDidTap() {
        let selectCollegeVC = SelectCollegeViewController()
        selectCollegeVC.modalPresentationStyle = .overFullScreen
        present(selectCollegeVC, animated: true)
    }
}

// MARK: - UITextFieldDelegate

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
