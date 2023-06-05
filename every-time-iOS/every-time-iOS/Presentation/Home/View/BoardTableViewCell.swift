//
//  BoardTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/23.
//

import UIKit

import SnapKit
import Then

protocol BoardTableViewCellDelegate {
    func boardPreviewCellDidSelected(_ index: Int) 
}

final class BoardTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let moreButton: UIButton = UIButton()
    private let favoriteBoardTableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Properties
    
    private let favoriteBoardList: [FavoriteBoardModel] = FavoriteBoardModel.dummyData()
    var delegate: BoardTableViewCellDelegate?
     
    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BoardTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        selectionStyle = .none
        
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 15
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        contentView.layer.borderWidth = 1
        
        titleLabel.do {
            $0.text = "즐겨찾는 게시판"
            $0.font = .systemFont(ofSize: 17, weight: .bold)
        }
        
        moreButton.do {
            $0.setTitle("더 보기 >", for: .normal)
            $0.setTitleColor(.red, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
        }
        
        favoriteBoardTableView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isScrollEnabled = false
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
            $0.register(BoardPreviewTableViewCell.self, forCellReuseIdentifier: BoardPreviewTableViewCell.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(titleLabel, moreButton, favoriteBoardTableView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(15)
        }
        
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        favoriteBoardTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
    }
    
    // MARK: - Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        favoriteBoardTableView.dataSource = self
        favoriteBoardTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension BoardTableViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteBoardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoardPreviewTableViewCell.cellIdentifier, for: indexPath) as! BoardPreviewTableViewCell
        cell.setDataBind(favoriteBoardList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.boardPreviewCellDidSelected(indexPath.row)
    }
}

// MARK: - UITableViewDelegate

extension BoardTableViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(30).adjusted
    }
}
