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
    private let termsTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Properties

    var termsList: [TermModel] = [TermModel(isOpened: false, isSatisfied: false, termTitle: "아래 약관에 모두 동의합니다."),
                                  TermModel(isOpened: true, isSatisfied: false, termTitle: "서비스 이용 약관 동의(필수)"),
                                  TermModel(isOpened: true, isSatisfied: false, termTitle: "개인정보 수집 및 이용 동의(필수)"),
                                  TermModel(isOpened: true, isSatisfied: false, termTitle: "커뮤니티 이용 규칙 확인(필수)"),
                                  TermModel(isOpened: true, isSatisfied: false, termTitle: "광고성 정보 수신 동의(선택)"),
                                  TermModel(isOpened: true, isSatisfied: false, termTitle: "본인 명의를 이용하여 가입을 진행하겠습니다."),
                                  TermModel(isOpened: true, isSatisfied: false, termTitle: "만 14세 이상입니다.")]
    var delegate: TermFooterViewDelegate?
    
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
        
        closeButton.do {
            $0.tintColor = .black
            $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        }
        
        backButton.do {
            $0.tintColor = .black
            $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        }
        
        termsTableView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
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
        if section == 0 {
            return 1
        } else {
            if !termsList[section].isOpened {
                return 1
            } else {
                return 2
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TermTitleTableViewCell.cellIdentifier, for: indexPath) as! TermTitleTableViewCell
            cell.setDataBind(termsList[indexPath.section])
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
        if indexPath.section == 0 {
            for i in 1..<termsList.count-2 {
                termsList[i].isOpened = false
                termsList[i].isSatisfied = true
            }
            termsList[0].isSatisfied = !termsList[0].isSatisfied
            tableView.reloadData()
        } else {
            if indexPath.row == 0 {
                termsList[indexPath.section].isOpened = !termsList[indexPath.section].isOpened
                termsList[indexPath.section].isSatisfied = !termsList[indexPath.section].isSatisfied
                tableView.reloadSections([indexPath.section], with: .none)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return CGFloat(40) }
        else { return CGFloat(100) }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = TermsHeaderView()
            return view
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? CGFloat(60) : CGFloat()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == termsList.count - 1 {
            let view = TermsFooterView()
            view.delegate = self
            return view
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == termsList.count - 1 ? CGFloat(120) : CGFloat()
    }
}

// MARK: - TermFooterViewDelegate

extension TermsViewController: TermFooterViewDelegate {
    
    func phoneAuthenticationButtonDidTap() {
        let signupVC = SignupViewController()
        signupVC.modalPresentationStyle = .overFullScreen
        present(signupVC, animated: false)
        
    }
    
    func iPinAuthenticationButtonDidTap() {
        let signupVC = SignupViewController()
        signupVC.modalPresentationStyle = .overFullScreen
        present(signupVC, animated: false)
    }
}
