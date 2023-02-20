//
//  DetailBoardViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

import UIKit

import SnapKit
import Then

class DetailBoardViewController: BoardViewController {

    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
    }
}

extension DetailBoardViewController {
    // MARK: - Methods
    
    @objc override func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonDidTap))
        backButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "내가 쓴 글"
    }
}
