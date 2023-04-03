//
//  SelectCollegeViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/06.
//

import UIKit

import SnapKit
import Then

final class SelectCollegeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let topView: UIView = UIView()
    private let topTitleLabel: UILabel = UILabel()
    private let closeButton: UIButton = UIButton()
    private let titleLabel: UILabel = UILabel()
    private let yearLabel: UILabel = UILabel()
    private let yearButton: UIButton = UIButton()
    private let classLabel: UILabel = UILabel()
    private let pickerView: UIPickerView = UIPickerView()
    private let schoolLabel: UILabel = UILabel()
    private let schoolTextField: UITextField = UITextField()
    private let nextButton: UIButton = UIButton()
    private let scrollView: UIScrollView = UIScrollView()
    private let schoolTableView: SchoolTableView = SchoolTableView(frame: .zero, style: .plain)
    
    // MARK: - Properties
    
    var yearMenuActions: [UIAction] = []
    var schoolList: [String] = ["경희대", "중앙대", "연세대 신촌캠", "경북대", "성균관대", "부산대", "고려대 서울캠", "서울대", "단국대", "영남대",
                                "계명대", "전남대", "강원대", "한양대 서울캠", "가천대", "인하대", "전북대", "동아대", "한국외대", "이화여대",
                                "조선대", "건국대 서울캠", "충남대", "국민대", "동국대 서울캠", "대구대", "부경대", "경상국립대", "숭실대", "홍익대 서울캠",
                                "동의대", "경기대", "충북대", "명지대", "세종대", "인천대", "울산대", "원광대", "숙명여대", "백석대", "경성대", "성신여대",
                                "호서대", "공주대", "아주대", "대구카톨릭대", "순청향대", "한남대", "서울과기대", "한양대 ERICA캠", "청주대", "서울시립대",
                                "제주대", "광운대", "경남대", "전주대", "수원대", "서강대", "가톨릭대", "남서울대", "동서대", "백석예대", "한국교통대", "서울여대",
                                "선문대", "한림대", "대전대", "인제대", "한밭대", "인하공업전문대", "창원대", "우송대", "건국대 GLOCAL캠", "연세대 미래캠",
                                "강릉원주대", "동덕여대", "대진대", "명지전문대", "한양여대", "똥국대 WISE캠", "한성대", "상명대 서울캠", "한국공학대",
                                "고려대 세종캠", "덕성여대", "순천대", "부산외대", "강남대", "부천대", "중부대", "동양미래대", "대림대", "배재대", "한성대",
                                "홍익대 세종캠", "세명대", "서원대", "가톨릭관동대", "서경대", "상명대 천안캠", "목원캠", "인덕대", "목포대", "신라대", "건양대",
                                "대구보건대", "경동대", "신구대", "신한대", "한국해양대", "꾼산대", "한국폴리텍대", "ICT폴리텍대", "KAIST", "KENTECK",
                                "UNIST"]
    var finalSchoolList: [String] = []
    var word: String = ""
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
        setAddTarget()
        setMenu()
        registerCells()
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
            $0.bounces = false
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
        
        yearButton.do {
            $0.backgroundColor = UIColor(r: 249, g: 249, b: 248)
            $0.layer.cornerRadius = 10
            $0.layer.borderColor = UIColor.systemGray6.cgColor
            $0.layer.borderWidth = 1
        }
        
        classLabel.do {
            $0.font = .systemFont(ofSize: 17)
            $0.text = "연도 선택 (학번)"
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
            $0.addRightImage(image: UIImage(systemName: "magnifyingglass")!, tintColor: .lightGray)
            $0.tintColor = .black
        }
        
        schoolTableView.do {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.separatorStyle = .none
        }
        
        nextButton.setRedButton("다음")
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(topView, scrollView)
        scrollView.addSubviews(titleLabel, yearLabel, yearButton, schoolLabel, schoolTextField, schoolTableView, nextButton)
        yearButton.addSubview(classLabel)
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

        yearButton.snp.makeConstraints {
            $0.top.equalTo(yearLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        classLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }

        schoolLabel.snp.makeConstraints {
            $0.top.equalTo(yearButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(25)
        }

        schoolTextField.snp.makeConstraints {
            $0.top.equalTo(schoolLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        schoolTableView.snp.makeConstraints {
            $0.top.equalTo(schoolTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(nextButton.snp.top).offset(-10)
        }
        
        nextButton.snp.makeConstraints {
            $0.leading.equalTo(yearButton.snp.leading)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        schoolTextField.delegate = self
        schoolTableView.dataSource = self
        schoolTableView.delegate = self
    }
    
    private func setAddTarget() {
        schoolTextField.addTarget(self, action: #selector(schoolTextFieldDidChange), for: .editingChanged)
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    private func registerCells() {
        schoolTableView.register(SchoolTableViewCell.self, forCellReuseIdentifier: SchoolTableViewCell.cellIdentifier)
    }
    
    private func setMenu() {
        let firstAction = UIAction(title: "연도 선택") { _ in }
        yearMenuActions.append(firstAction)
        for year in (1994...2023).reversed() {
            yearMenuActions.append(UIAction(title: "\(year)학번", state: .off, handler: { action in
                self.classLabel.text = "\(year)힉번"
            }))
        }
        let menu = UIMenu(children: yearMenuActions)
        yearButton.showsMenuAsPrimaryAction = true
        yearButton.menu = menu
    }
    
    // MARK: - @objc Methods
    
    @objc private func schoolTextFieldDidChange(textField: UITextField) {
        word = textField.text!
        
        if textField.text == "" {
            finalSchoolList = schoolList
        } else {
            finalSchoolList = schoolList.filter { $0.contains(word) }
        }
        schoolTableView.reloadData()
    }
    
    @objc private func closeButtonDidTap() {
        dismiss(animated: true)
    }
    
    @objc private func nextButtonDidTap() {
        let termsVC = TermsViewController()
        termsVC.modalPresentationStyle = .overFullScreen
        present(termsVC, animated: false)
    }
}

// MARK: - UITextFieldDelegate

extension SelectCollegeViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == schoolTextField {
            textField.text = ""
            textField.backgroundColor = .white
        }
        return true
    }
}

// MARK: - UITableViewDataSource

extension SelectCollegeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalSchoolList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SchoolTableViewCell.cellIdentifier, for: indexPath) as! SchoolTableViewCell
        cell.setDataBind(finalSchoolList[indexPath.row], word)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        schoolTextField.text = finalSchoolList[indexPath.row]
        schoolTextField.backgroundColor = UIColor(r: 249, g: 249, b: 248)
        schoolTextField.endEditing(true)
        finalSchoolList = []
        schoolTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension SelectCollegeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40)
    }
}
