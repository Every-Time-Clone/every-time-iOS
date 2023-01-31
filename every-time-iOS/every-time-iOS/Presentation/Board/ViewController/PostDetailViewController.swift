//
//  PostDetailViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/31.
//

import UIKit

import SnapKit
import Then

class PostDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let titleView = TitleView()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setNavigationBar()
    }
}

extension PostDetailViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        titleView.do { 
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.setNavigationBarTitle("자유게시판", "동국대 서울캠")
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action:  #selector(backButtonDidTap))
        backButton.tintColor = .black
        
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(menuButtonDidTap))
        menuButton.tintColor = .black
        
        let alarmButton = UIBarButtonItem(image: UIImage(systemName: "bell.slash"), style: .plain, target: self, action: #selector(alarmButtonDidTap))
        alarmButton.tintColor = .systemGray4
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItems = [menuButton, alarmButton]
        navigationItem.titleView = titleView
    }
    
    private func setAlarmAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
            self.dismiss(animated: true)
        }
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func menuButtonDidTap() {
        print("menu")
    }
    
    @objc private func alarmButtonDidTap(_ button: UIBarButtonItem) {
        if button.style == .plain {
            button.image = UIImage(systemName: "bell")
            button.tintColor = UIColor(r: 199, g: 39, b: 9)
            button.style = .done
            
            setAlarmAlert("댓글 알림을 켰습니다")
        } else {
            button.image = UIImage(systemName: "bell.slash")
            button.tintColor = .systemGray4
            button.style = .plain
            
            setAlarmAlert("댓글 알림을 껐습니다")
        }
    }
}
