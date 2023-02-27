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

    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
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
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(everyTimeImageView, descriptionLabel, everyTimeLabel)
        
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
    }
}
