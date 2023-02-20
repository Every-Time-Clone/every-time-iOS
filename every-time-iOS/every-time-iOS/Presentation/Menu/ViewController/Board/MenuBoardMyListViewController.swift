//
//  DetailBoardViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

import UIKit

import SnapKit
import Then

final class MenuBoardMyListViewController: BoardViewController {
    
    // MARK: - @objc Methods
    
    @objc override func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonDidTap))
        backButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "내가 쓴 글"
    }
    
    @objc override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuBoardPostVC = MenuBoardPostViewController()
        menuBoardPostVC.postDetail = postList[indexPath.row]
        navigationController?.pushViewController(menuBoardPostVC, animated: true)
    }
}
