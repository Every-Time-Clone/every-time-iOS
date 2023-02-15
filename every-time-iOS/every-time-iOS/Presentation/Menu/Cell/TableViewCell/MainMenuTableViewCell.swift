//
//  MainMenuTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

import UIKit

import SnapKit
import Then

protocol MainMenuTableViewCellDelegate {
    func mainMenuCellDidSelected()
}

final class MainMenuTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let menuTableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Properties
    
    let mainMenuList: [BoardMainMenu] = BoardMainMenu.dummyData()
    var delegate: MainMenuTableViewCellDelegate?

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

extension MainMenuTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        selectionStyle = .none
        
        setMenuBorder()
        
        menuTableView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.register(MainDetailTableViewCell.self, forCellReuseIdentifier: MainDetailTableViewCell.cellIdentifier)
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

extension MainMenuTableViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainMenuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainDetailTableViewCell.cellIdentifier, for: indexPath) as! MainDetailTableViewCell
        cell.setDataBind(mainMenuList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.mainMenuCellDidSelected()
    }
}

// MARK: - UITableViewDelegate

extension MainMenuTableViewCell: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
