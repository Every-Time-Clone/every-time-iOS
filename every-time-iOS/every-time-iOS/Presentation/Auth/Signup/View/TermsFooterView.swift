//
//  TermsFooterView.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/17.
//

import UIKit

import SnapKit
import Then

protocol TermFooterViewDelegate {
    func phoneAuthenticationButtonDidTap()
    func iPinAuthenticationButtonDidTap() 
}

class TermsFooterView: UIView {
    
    // MARK: - UI Components
    
    private let stackView: UIStackView = UIStackView()
    private let phoneAuthenticationButton: UIButton = UIButton()
    private let iPinAuthenticationButton: UIButton = UIButton()
    
    // MARK: - Properties
    
    var delegate: TermFooterViewDelegate?
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TermsFooterView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        phoneAuthenticationButton.setRedButton("휴대폰 인증")
        iPinAuthenticationButton.do {
            var attString = AttributedString("아이핀 인증")
            attString.font = .systemFont(ofSize: 15)
            attString.foregroundColor = .darkGray
            var configuration = UIButton.Configuration.plain()
            configuration.attributedTitle = attString
            $0.configuration = configuration
            $0.backgroundColor = UIColor(r: 241, g: 241, b: 242)
            $0.layer.cornerRadius = 10
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = CGFloat(10)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(stackView)
        stackView.addArrangedSubviews(phoneAuthenticationButton, iPinAuthenticationButton)
        
        phoneAuthenticationButton.snp.makeConstraints {
            $0.height.equalTo(40)
        }

        iPinAuthenticationButton.snp.makeConstraints {
            $0.height.equalTo(40)
        }

        stackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        phoneAuthenticationButton.addTarget(self, action: #selector(phoneAuthenticationButtonDidTap), for: .touchUpInside)
        iPinAuthenticationButton.addTarget(self, action: #selector(iPinAuthenticationButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc private func phoneAuthenticationButtonDidTap() {
        self.delegate?.phoneAuthenticationButtonDidTap()
    }
    
    @objc private func iPinAuthenticationButtonDidTap() {
        self.delegate?.iPinAuthenticationButtonDidTap()
    }
}
