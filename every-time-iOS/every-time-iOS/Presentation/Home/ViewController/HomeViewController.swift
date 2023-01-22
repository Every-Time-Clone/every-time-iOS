//
//  HomeViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/17.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let topView: UIView = UIView()
    private let everyTimeLabel: UILabel = UILabel()
    private let campusNameLabel: UILabel = UILabel()
    private let searchButton: UIButton = UIButton()
    private let myPageButton: UIButton = UIButton()
    private let homeTableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
    }
}

extension HomeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        topView.do {
            $0.backgroundColor = .cyan
        }
        
        everyTimeLabel.do {
            $0.text = "에브리타임"
            $0.textColor = .red
            $0.font = .systemFont(ofSize: 12)
        }
        
        campusNameLabel.do {
            $0.text = "동국대 서울캠"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        searchButton.do {
            $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            $0.tintColor = .black
        }
        
        myPageButton.do {
            $0.setImage(UIImage(systemName: "person"), for: .normal)
            $0.tintColor = .black
        }
        
        homeTableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.cellIdentifier)
            $0.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.cellIdentifier)
            $0.register(BannerTableViewCell.self, forCellReuseIdentifier: BannerTableViewCell.cellIdentifier)
            $0.register(BoardTableViewCell.self, forCellReuseIdentifier: BoardTableViewCell.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(topView, homeTableView)
        topView.addSubviews(everyTimeLabel, campusNameLabel, searchButton, myPageButton)
        
        topView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
        
        everyTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        campusNameLabel.snp.makeConstraints {
            $0.top.equalTo(everyTimeLabel.snp.bottom).offset(3)
            $0.leading.equalTo(everyTimeLabel)
        }
        
        myPageButton.snp.makeConstraints {
            $0.centerY.equalTo(campusNameLabel)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(myPageButton)
            $0.trailing.equalTo(myPageButton.snp.leading).offset(-20)
        }
        
        homeTableView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case HomeCellType.event.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.cellIdentifier, for: indexPath)
            return cell
        case HomeCellType.menu.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.cellIdentifier, for: indexPath)
            return cell
        case HomeCellType.banner.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.cellIdentifier, for: indexPath)
            return cell
        case HomeCellType.board.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: BoardTableViewCell.cellIdentifier, for: indexPath)
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case HomeCellType.event.rawValue:
            return 200
        case HomeCellType.menu.rawValue:
            return 100
        case HomeCellType.banner.rawValue:
            return 90
        case HomeCellType.board.rawValue:
            return 400
        default:
            return 50
        }
    }
}
