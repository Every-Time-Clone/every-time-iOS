//
//  TermsViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/13.
//

import UIKit

import SnapKit
import Then

final class TermsViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let topView: UIView = UIView()
    private let topTitleLabel: UILabel = UILabel()
    private let closeButton: UIButton = UIButton()
    private let backButton: UIButton = UIButton()
    private let scrollView: UIScrollView = UIScrollView()
    private let checkButton: UIButton = UIButton()
    private let termsTableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Properties

    var termsList: [TermModel] = TermModel.termDummyData()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setAddTarget()
        setDelegate()
    }
}

extension TermsViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        topTitleLabel.do {
            $0.text = "회원가입"
            $0.font = .systemFont(ofSize: 17, weight: .semibold)
        }
        
        scrollView.do {
            $0.backgroundColor = .white
        }
        
        closeButton.do {
            $0.tintColor = .black
            $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        }
        
        backButton.do {
            $0.tintColor = .black
            $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        }
        
        termsTableView.do {
            $0.backgroundColor = .yellow
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.register(TermTitleTableViewCell.self, forCellReuseIdentifier: TermTitleTableViewCell.cellIdentifier)
            $0.register(TermDescriptionTableViewCell.self, forCellReuseIdentifier: TermDescriptionTableViewCell.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(topView, termsTableView)
        topView.addSubviews(topTitleLabel, closeButton, backButton)
        
        topView.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }

        closeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-15)
            $0.centerY.equalToSuperview()
        }
        
        topTitleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
        }
        
        termsTableView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
    }
    
    private func setDelegate() {
        termsTableView.dataSource = self
        termsTableView.delegate = self
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        dismiss(animated: false)
    }
    
    @objc private func closeButtonDidTap() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
}

// MARK: - UITableViewDelegate

extension TermsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return termsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !termsList[section].isOpened {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TermTitleTableViewCell.cellIdentifier, for: indexPath) as! TermTitleTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TermDescriptionTableViewCell.cellIdentifier, for: indexPath) as! TermDescriptionTableViewCell
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension TermsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            termsList[indexPath.section].isOpened = !termsList[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }
}
