//
//  PostDetailViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/31.
//

import UIKit

import SnapKit
import Then

enum CommentType {
    case comment
    case reply
    
    var isComment: Bool {
        switch self {
        case .comment:
            return true
        case .reply:
            return false
        }
    }
}

class PostDetailViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleView = TitleView()
    private let postTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Properties
    
    let commentList: [CommentModel] = CommentModel.dummyData()
    var commentType = CommentType.comment.isComment
    var postDetail: PostModel?
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setNavigationBar()
        setDelegate()
        
//        print(postDetail)
    }
}

extension PostDetailViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        titleView.do { 
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.setNavigationBarTitle("자유게시판", "동국대 서울캠")
        }
        
        postTableView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.cellIdentifier)
            $0.register(ReplyTableViewCell.self, forCellReuseIdentifier: ReplyTableViewCell.cellIdentifier)
            $0.register(PostTableViewHeader.self, forHeaderFooterViewReuseIdentifier: PostTableViewHeader.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(postTableView)
        
        postTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action:  #selector(backButtonDidTap))
        backButton.tintColor = .black
        
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(menuButtonDidTap))
        menuButton.tintColor = .black
        
        let alarmButton = UIBarButtonItem(image: UIImage(systemName: "bell.slash"), style: .plain, target: self, action: #selector(alarmButtonDidTap))
        alarmButton.tintColor = .systemGray4
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItems = [menuButton, alarmButton]
        navigationItem.titleView = titleView
    }
    
    private func setAlarmAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
            self.dismiss(animated: true)
        }
    }
    
    private func setMenuAlert() {
        let alert = UIAlertController(title: "글 메뉴", message: nil, preferredStyle: .actionSheet)
        let messageAction = UIAlertAction(title: "쪽지 보내기", style: .default, handler: nil)
        let reportAction = UIAlertAction(title: "신고", style: .default, handler: nil)
        let shareAction = UIAlertAction(title: "URL 공유", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(messageAction)
        alert.addAction(reportAction)
        alert.addAction(shareAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func setDelegate() {
        postTableView.dataSource = self
        postTableView.delegate = self
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func menuButtonDidTap() {
        setMenuAlert()
    }
    
    @objc private func alarmButtonDidTap(_ button: UIBarButtonItem) {
        if button.style == .plain {
            button.image = UIImage(systemName: "bell")
            button.tintColor = UIColor(r: 199, g: 39, b: 9)
            button.style = .done
            
            setAlarmAlert("댓글 알림을 켰습니다")
        } else {
            button.image = UIImage(systemName: "bell.slash")
            button.tintColor = .systemGray4
            button.style = .plain
            
            setAlarmAlert("댓글 알림을 껐습니다")
        }
    }
}

// MARK: - UITableViewDataSource

extension PostDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        commentType = commentList[indexPath.row].isComment
        
        switch commentType {
        case true:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.cellIdentifier, for: indexPath) as! CommentTableViewCell
            cell.setDataBind(commentList[indexPath.row])
            return cell
        case false:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReplyTableViewCell.cellIdentifier, for: indexPath) as! ReplyTableViewCell
            cell.setDataBind(commentList[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: PostTableViewHeader.cellIdentifier) as! PostTableViewHeader
        guard let postDetail = postDetail else { return nil }
        header.setDataBind(postDetail)
        return header
    }
}

// MARK: - UITableViewDelegate

extension PostDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        commentType = commentList[indexPath.row].isComment
        
        switch commentType {
        case true:
            return UITableView.automaticDimension
        case false:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}
