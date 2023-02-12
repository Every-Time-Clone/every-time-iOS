//
//  MenuViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/17.
//

import UIKit

import SnapKit
import Then

final class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }
}

extension MenuViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .yellow
        
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
}
