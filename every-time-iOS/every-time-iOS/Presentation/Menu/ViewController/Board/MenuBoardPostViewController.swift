//
//  MenuBoardPostViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/20.
//

import UIKit

import SnapKit
import Then

class MenuBoardPostViewController: PostDetailViewController {
    
    // MARK: - @objc Methods
    
    @objc override func setMenuAlert() {
        let alert = UIAlertController(title: "글 메뉴", message: nil, preferredStyle: .actionSheet)
        let modifyAction = UIAlertAction(title: "수정", style: .default) { _ in
            self.modifyButtonDidTap()
        }
        let deleteAction = UIAlertAction(title: "삭제", style: .default, handler: nil)
        let shareAction = UIAlertAction(title: "URL 공유", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addActions(modifyAction, deleteAction, shareAction, cancelAction)
        present(alert, animated: true)
    }
    
    // MARK: - Methods
    
    private func modifyButtonDidTap() {
        print("d")
    }
}
