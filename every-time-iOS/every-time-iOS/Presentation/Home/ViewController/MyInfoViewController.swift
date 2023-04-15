//
//  MyInfoViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/04/15.
//

import UIKit

import SnapKit
import Then

final class MyInfoViewController: UIViewController {

    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }
}

extension MyInfoViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .yellow
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
}
