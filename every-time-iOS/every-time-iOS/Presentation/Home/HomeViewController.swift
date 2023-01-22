//
//  HomeViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/17.
//

import UIKit

import SnapKit
import Then

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let topView: UIView = UIView()
    private let everyTimeLabel: UILabel = UILabel()
    private let campusNameLabel: UILabel = UILabel()
    private let searchButton: UIButton = UIButton()
    private let myPageButton: UIButton = UIButton()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
}

extension HomeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        topView.do {
            $0.backgroundColor = .yellow
        }
        
        everyTimeLabel.do {
            $0.text = "에브리타임"
            $0.textColor = .red
            $0.font = .systemFont(ofSize: 12)
        }
        
        campusNameLabel.do {
            $0.text = "동국대 서울캠"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        searchButton.do {
            $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            $0.tintColor = .black
        }
        
        myPageButton.do {
            $0.setImage(UIImage(systemName: "person"), for: .normal)
            $0.tintColor = .black
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(topView)
        topView.addSubviews(everyTimeLabel, campusNameLabel, searchButton, myPageButton)
        
        topView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }
        
        everyTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        campusNameLabel.snp.makeConstraints {
            $0.top.equalTo(everyTimeLabel.snp.bottom).offset(3)
            $0.leading.equalTo(everyTimeLabel)
        }
        
        myPageButton.snp.makeConstraints {
            $0.centerY.equalTo(campusNameLabel)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(myPageButton)
            $0.trailing.equalTo(myPageButton.snp.leading).offset(-20)
        }
    }
}
