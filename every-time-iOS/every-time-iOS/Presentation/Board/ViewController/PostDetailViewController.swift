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

enum AnonymityButtonType {
    case anonymity
    case nickname
}

class PostDetailViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleView: TitleView = TitleView()
    private let postTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    private let textFieldBackgroundView: UIView = UIView()
    private let textFieldView: UIView = UIView()
    private let sendButton: UIButton = UIButton()
    private let anonymityButton: UIButton = UIButton()
    private let commentTextView: UITextView = UITextView()
    
    // MARK: - Properties
    
    let commentList: [CommentModel] = CommentModel.dummyData()
    var commentType = CommentType.comment.isComment
    var anonymityButtonType = AnonymityButtonType.anonymity
    var postDetail: PostModel?
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setNavigationBar()
        setDelegate()
        setAddTarget()
        setNotificationCenter()
        setTapGesture()
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
            $0.estimatedSectionHeaderHeight = CGFloat(100)
        }
        
        textFieldBackgroundView.do {
            $0.backgroundColor = .white
        }
        
        textFieldView.do {
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 8
        }
        
        sendButton.do {
            $0.setImage(UIImage(systemName: "paperplane"), for: .normal)
            $0.tintColor = .everytimeRed
        }
        
        commentTextView.do {
            $0.backgroundColor = .clear
            $0.font = .systemFont(ofSize: 13)
            $0.text = "댓글을 입력하세요."
            $0.textColor = .lightGray
            $0.isScrollEnabled = false
            $0.sizeToFit()
            $0.tintColor = .everytimeRed
        }

        setAnonymityButton("checkmark.square.fill", .everytimeRed)
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(postTableView, textFieldBackgroundView)

        textFieldBackgroundView.addSubviews(textFieldView)
        textFieldView.addSubviews(anonymityButton, commentTextView, sendButton)
        
        postTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(textFieldBackgroundView.snp.top)
        }
         
        commentTextView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.equalTo(anonymityButton.snp.trailing).offset(5)
            $0.trailing.equalTo(sendButton.snp.leading).offset(-5)
        }

        textFieldBackgroundView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(textFieldView.snp.top).offset(-7)
        }

        textFieldView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-7)
            $0.top.equalTo(commentTextView.snp.top).offset(-5)
            $0.leading.equalToSuperview().offset(7)
            $0.trailing.equalToSuperview().offset(-7)
        }

        sendButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-12)
            $0.trailing.equalToSuperview().offset(-5)
            $0.width.height.equalTo(20)
        }

        anonymityButton.snp.makeConstraints {
            $0.centerY.equalTo(sendButton)
            $0.leading.equalToSuperview().offset(10)
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
    
    private func setDelegate() {
        postTableView.dataSource = self
        postTableView.delegate = self
        
        commentTextView.delegate = self
    }
    
    private func setAnonymityButton(_ imageName: String, _ color: UIColor) {
        var configuration = UIButton.Configuration.plain()
        var attString = AttributedString("익명")
        attString.font = .systemFont(ofSize: 12, weight: .semibold)
        attString.foregroundColor = color
        
        configuration.attributedTitle = attString
        configuration.image = UIImage(systemName: imageName)
        configuration.preferredSymbolConfigurationForImage = .init(pointSize: 10)
        configuration.imagePadding = CGFloat(3)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        anonymityButton.tintColor = color
        anonymityButton.configuration = configuration
    }
    
    private func setAddTarget() {
        anonymityButton.addTarget(self, action: #selector(anonymityButtonDidTap), for: .touchUpInside)
    }
    
    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - @objc Methods
    
    @objc func setMenuAlert() {
        let alert = UIAlertController(title: "글 메뉴", message: nil, preferredStyle: .actionSheet)
        let messageAction = UIAlertAction(title: "쪽지 보내기", style: .default, handler: nil)
        let reportAction = UIAlertAction(title: "신고", style: .default, handler: nil)
        let shareAction = UIAlertAction(title: "URL 공유", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addActions(messageAction, reportAction, shareAction, cancelAction)
        present(alert, animated: true)
    }
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func menuButtonDidTap() {
        setMenuAlert()
    }
    
    @objc private func alarmButtonDidTap(_ button: UIBarButtonItem) {
        if button.style == .plain {
            button.image = UIImage(systemName: "bell")
            button.tintColor = .everytimeRed
            button.style = .done
            
            setAlarmAlert("댓글 알림을 켰습니다")
        } else {
            button.image = UIImage(systemName: "bell.slash")
            button.tintColor = .systemGray4
            button.style = .plain
            
            setAlarmAlert("댓글 알림을 껐습니다")
        }
    }
    
    @objc private func anonymityButtonDidTap() {
        if anonymityButtonType == .anonymity {
            anonymityButtonType = .nickname
            setAnonymityButton("square", .lightGray)
        } else {
            anonymityButtonType = .anonymity
            setAnonymityButton("checkmark.square.fill", .everytimeRed)
        }
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) else { return }
        let height = keyboardFrame.size.height - view.safeAreaInsets.bottom
        textFieldBackgroundView.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-height)
        }
    }
    
    @objc private func keyboardWillHide() {
        textFieldBackgroundView.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
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
            cell.delegate = self
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
        header.delegate = self
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

// MARK: - PostTableViewHeaderDelegate

extension PostDetailViewController: PostTableViewHeaderDelegate {
    
    func scrapButtonDidTap(_ scrapButtonState: ScrapButtonType) {
        switch scrapButtonState {
        case .scrapped:
            let alert = UIAlertController(title: "스크랩을 취소하시겠습니까?", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "취소", style: .cancel)
            let completeAction = UIAlertAction(title: "확인", style: .default) { _ in
                let alert = UIAlertController(title: "스크랩을 취소하였습니다.", message: nil, preferredStyle: .alert)
                self.present(alert, animated: true)
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
                    self.dismiss(animated: true)
                }
            }
            alert.addActions(cancelAction, completeAction)
            present(alert, animated: true)
        case .notScrapped:
            let alert = UIAlertController(title: "이 글을 스크랩하시겠습니까?", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "취소", style: .cancel)
            let completeAction = UIAlertAction(title: "확인", style: .default) { _ in
                let alert = UIAlertController(title: "이 글을 스크랩하였습니다.", message: nil, preferredStyle: .alert)
                self.present(alert, animated: true)
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
                    self.dismiss(animated: true)
                }
            }
            alert.addActions(cancelAction, completeAction)
            present(alert, animated: true)
        }
    }
}

// MARK: - UITextViewDelegate

extension PostDetailViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        } else if textView.text.isEmpty {
            textView.text = "댓글을 입력하세요."
            textView.textColor = .lightGray
        }
    }
}

// MARK: - CommentTableViewCellDelegate

extension PostDetailViewController: CommentTableViewCellDelegate {
    
    func replyButtonDidSelected(_ alert: UIAlertController) {
        present(alert, animated: true)
    }
    
    func replyOKButtonDidSelected(_ state: Bool) {
        if state { commentTextView.becomeFirstResponder() }
    }
    
    func likeButtonDidSelected(_ alert: UIAlertController) {
        present(alert, animated: true)
    }
    
    func likeOKButtonDidSelected(_ state: Bool) {
        if state {
            print("공감하기")
            // 공감 api 통신
        }
    }
    
    func menuButtonDidSelected(_ alert: UIAlertController) {
        present(alert, animated: true)
    }
}
