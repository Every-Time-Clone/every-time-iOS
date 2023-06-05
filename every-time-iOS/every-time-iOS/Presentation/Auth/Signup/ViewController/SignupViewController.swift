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
    private let idView: AuthDescriptionView = AuthDescriptionView()
    private let idTextField: AuthTextField = AuthTextField()
    private let passwordView: AuthDescriptionView = AuthDescriptionView()
    private let passwordTextField: AuthTextField = AuthTextField()
    private let passwordCheckTextField: AuthTextField = AuthTextField()
    private let emailView: AuthDescriptionView = AuthDescriptionView()
    private let emailTextField: AuthTextField = AuthTextField()
    private let nicknameView: AuthDescriptionView = AuthDescriptionView()
    private let nicknameTextField: AuthTextField = AuthTextField()
    private let signupButton: UIButton = UIButton()

    // MARK: - Properties

    private let signupManager: SignupManager = SignupManager()

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
        
        passwordTextField.do {
            $0.textContentType = .newPassword
            $0.isSecureTextEntry = true
        }
        
        passwordCheckTextField.do {
            $0.textContentType = .newPassword
            $0.isSecureTextEntry = true
        }
        
        idView.setAuthLabel(title: "아이디", description: "영문,숫자,4~20자")
        
        passwordView.setAuthLabel(title: "비밀번호", description: "영문,숫자,특문이 2종류 이상 조합된 8~20자")
        
        emailView.setAuthLabel(title: "이메일", description: "아이디/비밀번호 찾기에 필요")
        
        nicknameView.setAuthLabel(title: "닉네임", description: "커뮤니티 활동에 필요")
        
        signupButton.setRedButton("회원가입")
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(topView, titleLabel, idView, idTextField, passwordView, passwordTextField, passwordCheckTextField, emailView, emailTextField, nicknameView, nicknameTextField, signupButton)
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
        
        idView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.equalTo(titleLabel).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(idView.snp.bottom).offset(15)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        passwordView.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(30)
            $0.leading.equalTo(titleLabel).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordView.snp.bottom).offset(15)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(5)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        emailView.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(30)
            $0.leading.equalTo(titleLabel).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailView.snp.bottom).offset(15)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        nicknameView.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(30)
            $0.leading.equalTo(titleLabel).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameView.snp.bottom).offset(15)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        signupButton.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupButtonDidTap), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(idTextFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        passwordCheckTextField.addTarget(self, action: #selector(passwordCheckTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func isValidID(id: String) -> Bool {
        let regex = "^[A-Za-z0-9]{4,20}$"
        let isContains = id.range(of: regex, options: .regularExpression) != nil
        return isContains
    }
    
    private func isValidPassword(password: String) -> Bool {
        let regex = "^.{8,20}$"
        let isContains = password.range(of: regex, options: .regularExpression) != nil
        return isContains
    }
    
    private func checkValidState(isValid: Bool, textField: UITextField) {
        if isValid {
            textField.addRightImage(image: UIImage(systemName: "checkmark.circle")!, tintColor: .systemGreen)
        } else {
            textField.addRightImage(image: UIImage(), tintColor: .systemGreen)
        }
    }

    private func presentToTabBar() {
        let tabBar = EverytimeTabBarController()
        tabBar.modalTransitionStyle = .crossDissolve
        tabBar.modalPresentationStyle = .overFullScreen
        self.present(tabBar, animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        dismiss(animated: false)
    }
    
    @objc private func closeButtonDidTap() {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @objc private func signupButtonDidTap() {
        guard let email = emailTextField.text else { return }
        guard let nickname = nicknameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        let signupRequest = SignupReqeust(email: email, nickname: nickname, password: password)
        signupManager.reqeust(parameter: signupRequest) { [weak self] response in
            if response.statusCode == 201 {
                UserDefaults.standard.set(response.data.uuid, forKey: "UUID")
                self?.presentToTabBar()
            } else {
                self?.setAlertWithAnimation("회원가입 실패")
            }
        }
    }
    
    @objc private func idTextFieldDidChange(_ textField: UITextField) {
        checkValidState(isValid: isValidID(id: textField.text!), textField: textField)
    }
    
    @objc private func passwordTextFieldDidChange(_ textField: UITextField) {
        checkValidState(isValid: isValidPassword(password: textField.text!), textField: textField)
    }
    
    @objc private func passwordCheckTextFieldDidChange(_ textField: UITextField) {
        if textField.text! == passwordTextField.text! {
            textField.addRightImage(image: UIImage(systemName: "checkmark.circle")!, tintColor: .systemGreen)
        } else {
            textField.addRightImage(image: UIImage(), tintColor: .systemGreen)
        }
    }
}
