//
//  SignupViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/19.
//

import UIKit

import SnapKit
import Then

final class SignupViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }
}

extension SignupViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .yellow
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
}
