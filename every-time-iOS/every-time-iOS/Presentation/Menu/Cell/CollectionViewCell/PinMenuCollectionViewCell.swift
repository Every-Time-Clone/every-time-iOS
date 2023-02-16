//
//  PinMenuCollectionViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

import UIKit

import SnapKit
import Then

protocol PinMenuTableViewCellDelegate {
    func pinMenuCellDidSelected()
}

final class PinMenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let menuTableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Properties
    
    let pinMenuList: [PinMenuModel] = PinMenuModel.dummyData()
    var delegate: PinMenuTableViewCellDelegate?
    
    // MARK: - UI Components
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PinMenuCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        setMenuBorder()
        
        menuTableView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.isScrollEnabled = false
            $0.register(PinDetailTableViewCell.self, forCellReuseIdentifier: PinDetailTableViewCell.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(menuTableView)
        
        menuTableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-15)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension PinMenuCollectionViewCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pinMenuList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PinDetailTableViewCell.cellIdentifier, for: indexPath) as! PinDetailTableViewCell
        cell.setDataBind(pinMenuList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.pinMenuCellDidSelected()
    }
}

// MARK: - UITableViewDelegate

extension PinMenuCollectionViewCell: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
