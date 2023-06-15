//
//  BoardViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/30.
//

import Foundation
import UIKit

import SnapKit
import Then

class BoardViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleView: TitleView = TitleView()
    private let boardTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    private let writeButton: UIButton = UIButton()
    
    // MARK: - Properties
    
    var posts: [PostModel] = []
    private let postListManager: PostListManager = PostListManager()
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
        setAddTarget()
        fetchPosts()
    }
}

extension BoardViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        tabBarController?.tabBar.isHidden = true
        
        navigationController?.navigationBar.isHidden = false

        titleView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.setNavigationBarTitle("자유게시판", "동국대 서울캠")
        }
        
        boardTableView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.register(BoardTableViewHeader.self, forHeaderFooterViewReuseIdentifier: BoardTableViewHeader.cellIdentifier)
            $0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.cellIdentifier)
        }
        
        writeButton.do {
            var attString = AttributedString("글 쓰기")
            attString.font = .systemFont(ofSize: 14, weight: .semibold)
            attString.foregroundColor = .darkGray
            
            var configuration = UIButton.Configuration.plain()
            configuration.image = UIImage(systemName: "pencil")
            configuration.preferredSymbolConfigurationForImage = .init(pointSize: 15)
            configuration.attributedTitle = attString
            configuration.imagePadding = CGFloat(5)
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
            
            $0.tintColor = .everytimeRed
            $0.backgroundColor = UIColor(r: 249, g: 249, b: 249)
            $0.configuration = configuration
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 18
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(boardTableView, writeButton)
        
        boardTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        writeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        boardTableView.dataSource = self
        boardTableView.delegate = self
    }
    
    private func setAddTarget() {
        writeButton.addTarget(self, action: #selector(writeButtonDidTap), for: .touchUpInside)
    }
    
    private func presentToRegisterViewController() {
        let registerPostVC = UINavigationController(rootViewController: RegisterPostViewController())
        registerPostVC.modalPresentationStyle = .overFullScreen
        present(registerPostVC, animated: true)
    }

    // MARK: - Network

    private func fetchPosts() {
        postListManager.request { [weak self] response in
            response.forEach {
                self?.posts.insert($0.convertToPost(), at: 0)
            }
            self?.boardTableView.reloadData()
        }
    }
    
    // MARK: - @objc Methods
    
    @objc func setNavigationBar() {
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(menuButtonDidTap))
        
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonDidTap))

        navigationItem.rightBarButtonItems = [menuButton, searchButton]
        navigationItem.titleView = titleView
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func searchButtonDidTap() {
        print("검색")
    }
    
    @objc private func menuButtonDidTap() {
        print("menu")
    }
    
    @objc private func writeButtonDidTap() {
        presentToRegisterViewController()
    }
}

// MARK: - UITableViewDataSource

extension BoardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellIdentifier, for: indexPath) as! PostTableViewCell
        cell.setDataBind(posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = BoardTableViewHeader()
        return header
    }
    
    @objc func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postDetailVC = PostDetailViewController()
        postDetailVC.postDetail = posts[indexPath.row]
        navigationController?.pushViewController(postDetailVC, animated: true)
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
