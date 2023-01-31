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
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
}

extension PostDetailViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .yellow
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
}
