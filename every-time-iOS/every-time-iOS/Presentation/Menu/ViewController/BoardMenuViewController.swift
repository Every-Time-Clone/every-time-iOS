//
//  BoardMenuViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/12.
//

import UIKit

import SnapKit
import Then

final class BoardMenuViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let menuTableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setDelegate()
    }
}

extension BoardMenuViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        menuTableView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.register(MainMenuTableViewCell.self, forCellReuseIdentifier: MainMenuTableViewCell.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(menuTableView)
        
        menuTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension BoardMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MainMenuTableViewCell.cellIdentifier) as! MainMenuTableViewCell
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension BoardMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return CGFloat(250)
        default:
            return 0
        }
    }
}

// MARK: - MainMenuTableViewCellDelegate

extension BoardMenuViewController: MainMenuTableViewCellDelegate {
    
    func mainMenuCellDidSelected() {
        let detailBoardVC = DetailBoardViewController()
        navigationController?.pushViewController(detailBoardVC, animated: true)
    }
}
