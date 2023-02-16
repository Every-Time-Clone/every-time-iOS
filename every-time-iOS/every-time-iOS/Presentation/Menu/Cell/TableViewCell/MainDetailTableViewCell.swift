//
//  MainDetailTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

import UIKit

import SnapKit
import Then

final class MainDetailTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let menuImageView: UIImageView = UIImageView()
    private let menuNameLabel: UILabel = UILabel()

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainDetailTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        selectionStyle = .none
        
        contentView.backgroundColor = .clear
        
        menuNameLabel.do {
            $0.font = .systemFont(ofSize: 16)
            $0.text = "내가 쓴 글"
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(menuImageView, menuNameLabel)
        
        menuImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.width.height.equalTo(25)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(menuImageView)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(20)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(_ model: BoardMainMenuModel) {
        menuNameLabel.text = model.menuName
        menuImageView.image = UIImage(named: model.menuImageName)
    }
}
