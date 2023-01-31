//
//  BoardViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/30.
//

import UIKit

import SnapKit
import Then

class BoardViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleView = UIStackView()
    private let boardTitleLabel = UILabel()
    private let campusNameLabel = UILabel()
    private let boardTableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Properties
    
    let postList: [PostModel] = PostModel.dummyData()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setNavigationBar()
        setDelegate()
    }
}

extension BoardViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = false
        
        boardTitleLabel.do {
            $0.text = "자유게시판"
            $0.font = .systemFont(ofSize: 12)
            $0.textAlignment = .center
            $0.sizeToFit()
        }
        
        campusNameLabel.do {
            $0.text = "동국대 서울캠"
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .darkGray
            $0.textAlignment = .center
            $0.sizeToFit()
        }
        
        titleView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
        }
        
        boardTableView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.register(BoardTableViewHeader.self, forHeaderFooterViewReuseIdentifier: BoardTableViewHeader.cellIdentifier)
            $0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        titleView.addArrangedSubViews(boardTitleLabel, campusNameLabel)
        
        view.addSubviews(boardTableView)
        
        boardTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonDidTap))
        backButton.tintColor = .black
        
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(menuButtonDidTap))
        menuButton.tintColor = .black
        
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonDidTap))
        searchButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItems = [menuButton, searchButton]
        navigationItem.titleView = titleView
    }
    
    private func setDelegate() {
        boardTableView.dataSource = self
        boardTableView.delegate = self
    }
    
    private func pushToPostDetailViewController() {
        let postDetailVC = PostDetailViewController()
        navigationController?.pushViewController(postDetailVC, animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func searchButtonDidTap() {
        print("검색")
    }
    
    @objc private func menuButtonDidTap() {
        print("menu")
    }
}

// MARK: - UITableViewDataSource

extension BoardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellIdentifier, for: indexPath) as! PostTableViewCell
        cell.setDataBind(postList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = BoardTableViewHeader()
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToPostDetailViewController()
    }
}

// MARK: - UITableViewDelegate

extension BoardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
