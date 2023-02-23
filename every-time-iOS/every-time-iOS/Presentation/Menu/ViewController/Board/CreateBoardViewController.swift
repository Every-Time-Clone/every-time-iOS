//
//  CreateBoardViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/23.
//

import UIKit

import SnapKit
import Then

final class CreateBoardViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let completeButton = UIButton()
    
    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setNavigationBar()
    }
}

extension CreateBoardViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        completeButton.do {
            var attString = AttributedString("완료")
            attString.font = .systemFont(ofSize: 12, weight: .semibold)
            attString.foregroundColor = .white
            
            var configuration = UIButton.Configuration.plain()
            configuration.attributedTitle = attString
            
            $0.configuration = configuration
            $0.backgroundColor = .everytimeRed
            $0.layer.cornerRadius = 14
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        
        let rightBarButton = UIBarButtonItem(customView: completeButton)
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.title = "새 게시판 만들기"
    }
    
    private func setAddTarget() {
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc private func completeButtonDidTap() {
        // 이름 입력이 안 되었을 때 팝업창
        // 아닐 때는 게시판 생성 완료 팝업창 -> 팝업창은 extension으로 추가해 주자
    }
}
