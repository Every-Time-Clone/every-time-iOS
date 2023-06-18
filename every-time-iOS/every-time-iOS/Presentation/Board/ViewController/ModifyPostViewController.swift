//
//  ModifyPostViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/20.
//

import UIKit

import SnapKit
import Then

final class ModifyPostViewController: RegisterPostViewController {
    
    // MARK: - Properties
    
    var postDetail: PostModel?

    // MARK: - Initializer

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setPost()
    }
    
    // MARK: - Methods
    
    private func setPost() {
        guard let postDetail = postDetail else {return}
        titleTextField.text = postDetail.title
        contentTextView.text = postDetail.contents
        contentTextView.textColor = .black
    }
}
