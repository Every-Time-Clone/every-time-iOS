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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
}

extension BoardViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
}
