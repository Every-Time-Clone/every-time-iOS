//
//  RegisterViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/08.
//

import UIKit

import SnapKit
import Then

enum WriterType {
    case anonymous
    case identified
}

enum QuestionType {
    case question
    case normal
}

class RegisterPostViewController: UIViewController {
    
    // MARK: - UI Components

    private let scrollView: UIScrollView = UIScrollView()
    private let titleLabel: UILabel = UILabel()
    private let backButton: UIButton = UIButton()
    let completeButton: UIButton = UIButton()
    private let lineView: UIView = UIView()
    private let guidelineView: UIView = UIView()
    private let bottomView: UIView = UIView()
    private let cameraButton: UIButton = UIButton()
    private let anonymityButton: UIButton = UIButton()
    private let questionButton: UIButton = UIButton()
    let titleTextField: UITextField = UITextField()
    let contentTextView: UITextView = UITextView()
    
    // MARK: - Properties
    
    var questionType: QuestionType = .normal
    var writerType: WriterType = .anonymous
    private let registerPostManager: RegisterPostManager = RegisterPostManager()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setUI()
        setLayout()
        setAddTarget()
        setDelegate()
        setNotificationCenter()
        setTapGesture()
    }
}

extension RegisterPostViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "글 쓰기"
            $0.font = .systemFont(ofSize: 17, weight: .semibold)
        }
        
        backButton.do {
            $0.setImage(UIImage(systemName: "xmark"), for: .normal)
            $0.tintColor = .black
        }
        
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
        
        titleTextField.do {
            $0.placeholder = "제목"
            $0.backgroundColor = .white
            $0.font = .systemFont(ofSize: 17, weight: .bold)
            $0.tintColor = .everytimeRed
        }
        
        lineView.do {
            $0.backgroundColor = .systemGray5
        }
        
        contentTextView.do {
            $0.text = "내용을 입력하세요."
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .lightGray
            $0.isScrollEnabled = false
            $0.sizeToFit()
        }
        
        guidelineView.do {
            $0.backgroundColor = .cyan
        }
        
        cameraButton.do {
            $0.setImage(UIImage(systemName: "camera"), for: .normal)
            $0.tintColor = .black
        }
        
        anonymityButton.setCheckButton("익명", "checkmark.square.fill", .everytimeRed)
        
        questionButton.setCheckButton("질문", "square", .systemGray)
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(scrollView, bottomView)

        scrollView.addSubviews(titleTextField, lineView, contentTextView, guidelineView)

        bottomView.addSubviews(cameraButton, anonymityButton, questionButton)

        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomView.snp.top)
        }
        
        bottomView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }

        titleTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(30)
        }

        lineView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(titleTextField)
            $0.height.equalTo(1)
        }

        contentTextView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(titleTextField)
            $0.bottom.equalToSuperview()
        }
        
        cameraButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        anonymityButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        questionButton.snp.makeConstraints {
            $0.centerY.equalTo(anonymityButton)
            $0.trailing.equalTo(anonymityButton.snp.leading).offset(-15)
        }
    }
    
    // MARK: - Methods

    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButtonDidTap))
        backButton.tintColor = .black

        let completeButton = UIButton()
        var attString = AttributedString("완료")
        attString.font = .systemFont(ofSize: 13, weight: .bold)
        attString.foregroundColor = .white
        var config = UIButton.Configuration.plain()
        config.attributedTitle = attString
        completeButton.configuration = config
        completeButton.backgroundColor = .everytimeRed
        completeButton.layer.cornerRadius = 14
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)

        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: completeButton)
        navigationItem.title = "글 쓰기"
    }
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        questionButton.addTarget(self, action: #selector(questionButtonDidTap), for: .touchUpInside)
        anonymityButton.addTarget(self, action: #selector(anonymityButtonDidTap), for: .touchUpInside)
    }
    
    private func setDelegate() {
        contentTextView.delegate = self
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

    // MARK: - Network

    private func registerPost(_ request: PostRequest) {
        registerPostManager.request(request) { _ in }
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        dismiss(animated: true)
    }
    
    @objc func completeButtonDidTap() {
        guard let title = titleTextField.text,
              let contents = contentTextView.text else { return }
        let post = PostRequest(title: title, contents: contents)
        registerPost(post)
        dismiss(animated: true)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) else { return }
        let height = keyboardFrame.size.height - view.safeAreaInsets.bottom
        bottomView.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-height)
        }
    }
    
    @objc private func keyboardWillHide() {
        bottomView.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc private func questionButtonDidTap() {
        if questionType == .normal {
            questionType = .question
            questionButton.setCheckButton("질문", "checkmark.square.fill", .everytimeRed)
        } else {
            questionType = .normal
            questionButton.setCheckButton("질문", "square", .systemGray)
        }
    }
    
    @objc private func anonymityButtonDidTap() {
        if writerType == .anonymous {
            writerType = .identified
            anonymityButton.setCheckButton("익명", "square", .systemGray)
        } else {
            writerType = .anonymous
            anonymityButton.setCheckButton("익명", "checkmark.square.fill", .everytimeRed)
        }
    }
}

// MARK: - UITextFieldDelegate

extension RegisterPostViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
}
