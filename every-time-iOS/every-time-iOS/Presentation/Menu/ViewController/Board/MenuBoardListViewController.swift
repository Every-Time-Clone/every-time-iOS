//
//  MenuBoardListViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/20.
//

import UIKit

import SnapKit
import Then

final class MenuBoardListViewController: BoardViewController {
    
    // MARK: - Properties
    
    var navigationTitle: String?
    
    // MARK: - @objc Methods
    
    @objc override func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonDidTap))
        backButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backButton
        
        guard let test = navigationTitle else { return }
        navigationItem.title = test
    }
}
