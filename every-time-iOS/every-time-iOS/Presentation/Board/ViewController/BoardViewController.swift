//
//  BoardViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/30.
//

import UIKit

import SnapKit
import Then

class BoardViewController: UIViewController {
    
    // MARK: - Properties
    
    private let titleView = UIStackView()
    private let boardTitleLabel = UILabel()
    private let campusNameLabel = UILabel()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setNavigationBar()
    }
}

extension BoardViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = false
        
        boardTitleLabel.do {
            $0.text = "자유게시판"
            $0.font = .systemFont(ofSize: 12)
            $0.textAlignment = .center
            $0.sizeToFit()
        }
        
        campusNameLabel.do {
            $0.text = "동국대 서울캠"
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .darkGray
            $0.textAlignment = .center
            $0.sizeToFit()
        }
        
        titleView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        titleView.addArrangedSubViews(boardTitleLabel, campusNameLabel)
        
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonDidTap))
        backButton.tintColor = .black
        
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(menuButtonDidTap))
        menuButton.tintColor = .black
        
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonDidTap))
        searchButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItems = [menuButton, searchButton]
        navigationItem.titleView = titleView
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func searchButtonDidTap() {
        print("검색")
    }
    
    @objc private func menuButtonDidTap() {
        print("menu")
    }
}
