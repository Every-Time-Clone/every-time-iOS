//
//  CreateBoardViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/23.
//

import UIKit

import SnapKit
import Then

final class CreateBoardViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let completeButton: UIButton = UIButton()
    private let createBoardTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setNavigationBar()
        setAddTarget()
        setDelegate()
    }
}

extension CreateBoardViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        completeButton.do {
            var attString = AttributedString("완료")
            attString.font = .systemFont(ofSize: 12, weight: .semibold)
            attString.foregroundColor = .white
            
            var configuration = UIButton.Configuration.plain()
            configuration.attributedTitle = attString
            
            $0.configuration = configuration
            $0.backgroundColor = .everytimeRed
            $0.layer.cornerRadius = 14
        }
    
        createBoardTableView.do {
            $0.backgroundColor = .clear
            $0.separatorStyle = .none
            $0.register(BoardOptionTableViewCell.self, forCellReuseIdentifier: BoardOptionTableViewCell.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubview(createBoardTableView)
        
        createBoardTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        
        let rightBarButton = UIBarButtonItem(customView: completeButton)
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.title = "새 게시판 만들기"
    }
    
    private func setAddTarget() {
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    
    private func setDelegate() {
        createBoardTableView.dataSource = self
        createBoardTableView.delegate = self
    }
    
    // MARK: - @objc Methods
    
    @objc private func completeButtonDidTap() {
        setAlertWithAnimation("게시판 생성 완료")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - UITableViewDataSource

extension CreateBoardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BoardOptionTableViewCell.cellIdentifier, for: indexPath) as! BoardOptionTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension CreateBoardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CreateBoardTableViewHeader()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return UITableView.automaticDimension
        default:
            return CGFloat(0)
        }
    }
}
