//
//  SetNicknameViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class SetNicknameViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let nicknameLabel: UILabel = UILabel()
    private let nicknameTextField: InfoTextField = InfoTextField()
    private let descriptionBlackLabel: UILabel = UILabel()
    private let descriptionRedLabel: UILabel = UILabel()
    private let completeButton: UIButton = UIButton()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setDelegate()
        setNavigationBar()
        setAddTarget()
    }
}

extension SetNicknameViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        nicknameLabel.do {
            $0.text = "닉네임"
            $0.font = .systemFont(ofSize: 13, weight: .bold)
            $0.textColor = .darkGray
        }
        
        nicknameTextField.do {
            $0.placeholder = "닉네임"
        }
        
        descriptionBlackLabel.do {
            $0.text = "※ 닉네임을 설정하면"
            $0.font = .systemFont(ofSize: 11)
            $0.textColor = .darkGray
        }
        
        descriptionRedLabel.do {
            $0.text = "30일간 변경할 수 없습니다."
            $0.font = .systemFont(ofSize: 11)
            $0.textColor = .everytimeRed
        }
        
        completeButton.setRedButton("닉네임 설정")
    }
    
    // MARK: - Custom Methods
    
    private func setLayout() {
        view.addSubviews(nicknameLabel, nicknameTextField, descriptionBlackLabel, descriptionRedLabel, completeButton)

        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(25)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        descriptionBlackLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            $0.leading.equalTo(nicknameTextField)
        }
        
        descriptionRedLabel.snp.makeConstraints {
            $0.centerY.equalTo(descriptionBlackLabel)
            $0.leading.equalTo(descriptionBlackLabel.snp.trailing).offset(5)
        }
        
        completeButton.snp.makeConstraints {
            $0.top.equalTo(descriptionBlackLabel.snp.bottom).offset(20)
            $0.leading.equalTo(nicknameTextField)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
    
    private func setDelegate() {
        nicknameTextField.delegate = self
    }
    
    private func setAddTarget() {
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    
    private func setNavigationBar() {
        navigationItem.title = "닉네임 설정"
        
        let dismissButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissButtonDidTap))
        dismissButton.tintColor = .black
        navigationItem.rightBarButtonItem = dismissButton
    }
    
    // MARK: - @objc Methods
    
    @objc private func dismissButtonDidTap() {
        dismiss(animated: true)
    }
    
    @objc private func completeButtonDidTap() {
        let alertVC = UIAlertController(title: "닉네임을 설정하면 30일간 변경할\n수 없습니다. 변경하시겠습니까?", message: nil, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "아니오", style: .default)
        let okButton = UIAlertAction(title: "예", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertVC.addActions(cancelButton, okButton)
        
        present(alertVC, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension SetNicknameViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }
}
