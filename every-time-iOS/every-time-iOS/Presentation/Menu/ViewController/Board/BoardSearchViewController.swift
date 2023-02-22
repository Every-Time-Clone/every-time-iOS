//
//  BoardSearchViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/22.
//

import UIKit

import SnapKit
import Then

final class BoardSearchViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let searchBar: UISearchBar = UISearchBar()
    private let searchImageView: UIImageView = UIImageView()
    private let searchLabel: UILabel = UILabel()
    private let makeBoardButton: UIButton = UIButton()

    // MARK: - Initializer
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
        setTabBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }
}

extension BoardSearchViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        searchBar.do {
            $0.placeholder = "게시판 이름"
            $0.tintColor = .black
        }
        
        searchImageView.do {
            $0.image = UIImage(systemName: "magnifyingglass")
            $0.tintColor = .systemGray3
        }
        
        searchLabel.do {
            $0.text = "다른 게시판을 검색해 보세요"
            $0.textColor = .lightGray
            $0.font = .systemFont(ofSize: 17, weight: .bold)
        }
        
        makeBoardButton.do {
            var attString = AttributedString("새 게시판 만들기")
            attString.font = .systemFont(ofSize: 14, weight: .bold)
            attString.foregroundColor = .white
            
            var configuration = UIButton.Configuration.plain()
            configuration.attributedTitle = attString
            
            $0.backgroundColor = .everytimeRed
            $0.configuration = configuration
            $0.layer.cornerRadius = 15
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(searchImageView, searchLabel, makeBoardButton)
        
        searchImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.width.height.equalTo(60)
        }
        
        searchLabel.snp.makeConstraints {
            $0.top.equalTo(searchImageView.snp.bottom).offset(5)
            $0.centerX.equalTo(searchImageView)
        }
        
        makeBoardButton.snp.makeConstraints {
            $0.top.equalTo(searchLabel.snp.bottom).offset(15)
            $0.centerX.equalTo(searchImageView)
        }
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false

        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonDidTap))
        cancelButton.tintColor = .black
        navigationItem.rightBarButtonItem = cancelButton
        navigationItem.titleView = searchBar
        navigationItem.hidesBackButton = true
    }
    
    private func setTabBar() {
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - @objc Methods
    
    @objc private func cancelButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
