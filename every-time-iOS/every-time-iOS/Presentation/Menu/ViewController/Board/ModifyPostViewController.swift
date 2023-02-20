//
//  ModifyPostViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/20.
//

import UIKit

import SnapKit
import Then

class ModifyPostViewController: WriteViewController {
    
    // MARK: - Properties
    
    var postDetail: PostModel?

    // MARK: - Initializer
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
        setPost()
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setPost() {
        guard let postDetail = postDetail else {return}
        titleTextField.text = postDetail.title
        contentTextView.text = postDetail.content
        contentTextView.textColor = .black
    }
}
