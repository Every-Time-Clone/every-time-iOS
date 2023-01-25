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
    
    private let headerView: UIView = UIView()
    private let everyTimeLabel: UILabel = UILabel()
    private let campusNameLabel: UILabel = UILabel()
    private let searchButton: UIButton = UIButton()
    private let myPageButton: UIButton = UIButton()
    private let homeTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Properties

    private let headerHeight: CGFloat = CGFloat(60)
    private var headerHeightConstraint: NSLayoutConstraint?
    
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
        everyTimeLabel.do {
            $0.text = "에브리타임"
            $0.textColor = UIColor(r: 199, g: 39, b: 9)
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
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.register(BoardTableViewCell.self, forCellReuseIdentifier: BoardTableViewCell.cellIdentifier)
            $0.register(HomeTableViewHeader.self, forHeaderFooterViewReuseIdentifier: HomeTableViewHeader.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(headerView, homeTableView)
        headerView.addSubviews(everyTimeLabel, campusNameLabel, searchButton, myPageButton)
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
        
        everyTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(7)
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
            $0.top.equalTo(headerView.snp.bottom)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoardTableViewCell.cellIdentifier, for: indexPath) as! BoardTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeTableViewHeader.cellIdentifier)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(380).adjusted
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return CGFloat(8 * CGFloat(30).adjusted + 80)
    }
}

// MARK: - UIScrollViewDelegate

extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 100 {
            everyTimeLabel.isHidden = true
            
            campusNameLabel.snp.remakeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().offset(20)
            }
            
            headerView.snp.remakeConstraints {
                $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
                $0.height.equalTo(50)
            }
        } else {
            everyTimeLabel.isHidden = false
            everyTimeLabel.alpha = abs(scrollView.contentOffset.y - 100) / 100
            
            self.headerView.snp.remakeConstraints {
                $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
                $0.height.equalTo(60)
            }
            
            self.everyTimeLabel.snp.remakeConstraints {
                $0.top.equalToSuperview().offset(7)
                $0.leading.equalToSuperview().offset(20)
            }
            
            self.campusNameLabel.snp.remakeConstraints {
                $0.top.equalTo(self.everyTimeLabel.snp.bottom).offset(3)
                $0.leading.equalTo(self.everyTimeLabel)
            }
        }
    }
}
