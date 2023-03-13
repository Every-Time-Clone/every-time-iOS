//
//  SelectCollegeViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/06.
//

import UIKit

import SnapKit
import Then

class SelectCollegeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let topView: UIView = UIView()
    private let topTitleLabel: UILabel = UILabel()
    private let closeButton: UIButton = UIButton()
    private let titleLabel: UILabel = UILabel()
    private let yearLabel: UILabel = UILabel()
    private let yearTextField: UITextField = UITextField()
    private let pickerView: UIPickerView = UIPickerView()
    private let schoolLabel: UILabel = UILabel()
    private let schoolTextField: UITextField = UITextField()
    private let nextButton: UIButton = UIButton()
    private let scrollView: UIScrollView = UIScrollView()
    private let schoolTableView: SchoolTableView = SchoolTableView(frame: .zero, style: .plain)
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
        setAddTarget()
    }
}

extension SelectCollegeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        topView.do {
            $0.backgroundColor = .white
        }
        
        scrollView.do {
            $0.backgroundColor = .white
        }
        
        topTitleLabel.do {
            $0.text = "회원가입"
            $0.font = .systemFont(ofSize: 17, weight: .semibold)
        }
        
        closeButton.do {
            $0.tintColor = .black
            $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        }
        
        titleLabel.do {
            $0.text = "학교 선택"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        yearLabel.do {
            $0.text = "입학년도"
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
            $0.textColor = .darkGray
        }
        
        yearTextField.do {
            $0.backgroundColor = .cyan
        }
        
        schoolLabel.do {
            $0.text = "학교"
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
            $0.textColor = .darkGray
        }
        
        schoolTextField.do {
            $0.backgroundColor = UIColor(r: 249, g: 249, b: 248)
            var attString = AttributedString("학교 이름을 검색하세요.")
            attString.font = .systemFont(ofSize: 17)
            attString.foregroundColor = .lightGray
            $0.attributedPlaceholder = NSAttributedString(attString)
            $0.addLeftPadding(width: CGFloat(10))
            $0.layer.cornerRadius = 10
            $0.layer.borderColor = UIColor.systemGray6.cgColor
            $0.layer.borderWidth = 1
            $0.addRightPadding(width: CGFloat(10))
            $0.addRightImage(image: UIImage(systemName: "magnifyingglass")!)
            $0.tintColor = .black
        }
        
        schoolTableView.do {
            $0.backgroundColor = .yellow
            $0.isScrollEnabled = false
            $0.register(SchoolTableViewCell.self, forCellReuseIdentifier: SchoolTableViewCell.cellIdentifier)
        }
        
        nextButton.do {
            var attString = AttributedString("다음")
            attString.font = .systemFont(ofSize: 15, weight: .bold)
            attString.foregroundColor = .white
            var configuration = UIButton.Configuration.plain()
            configuration.attributedTitle = attString
            $0.configuration = configuration
            $0.backgroundColor = .everytimeRed
            $0.layer.cornerRadius = 10
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(topView, scrollView)
        scrollView.addSubview(schoolTableView)
        scrollView.addSubviews(titleLabel, yearLabel, yearTextField, schoolLabel, schoolTextField, schoolTableView, nextButton)
        topView.addSubviews(topTitleLabel, closeButton)
        
        topView.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        topTitleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }

        closeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-15)
            $0.centerY.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }

        yearLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(25)
        }

        yearTextField.snp.makeConstraints {
            $0.top.equalTo(yearLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }

        schoolLabel.snp.makeConstraints {
            $0.top.equalTo(yearTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(25)
        }

        schoolTextField.snp.makeConstraints {
            $0.top.equalTo(schoolLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }

        schoolTableView.snp.makeConstraints {
            $0.top.equalTo(schoolTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(nextButton.snp.top)
        }

        nextButton.snp.makeConstraints {
            $0.leading.equalTo(yearTextField.snp.leading)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        schoolTextField.delegate = self
        schoolTableView.dataSource = self
//        schoolTableView.delegate = self
    }
    
    private func setAddTarget() {
        schoolTextField.addTarget(self, action: #selector(schoolTextFieldDidChange), for: .editingChanged)
    }
    
    // MARK: - @objc Methods
    
    @objc private func schoolTextFieldDidChange() {
        print(schoolTextField.text!)
    }
}

// MARK: - UITextFieldDelegate

extension SelectCollegeViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }
}

// MARK: - UITableViewDataSource

extension SelectCollegeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SchoolTableViewCell.cellIdentifier, for: indexPath) as! SchoolTableViewCell
        return cell
    }
}
