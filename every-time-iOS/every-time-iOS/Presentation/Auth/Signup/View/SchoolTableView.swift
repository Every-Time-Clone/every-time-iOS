//
//  SchoolTableView.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/09.
//

import UIKit

import SnapKit
import Then

class SchoolTableView: UITableView {
    
    // MARK: - Initializer
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let height = contentSize.height + contentInset.top + contentInset.bottom
        return CGSize(width: contentSize.width, height: height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        invalidateIntrinsicContentSize()
    }
}
