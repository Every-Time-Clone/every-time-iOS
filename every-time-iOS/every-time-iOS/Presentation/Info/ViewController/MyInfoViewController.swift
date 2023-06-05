//
//  MyInfoViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/04/15.
//

import UIKit

import PhotosUI
import SnapKit
import Then

final class MyInfoViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let infoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Properties
    
    let categoryNames: [String] = ["계정", "커뮤니티", "앱 설정", "이용 안내", "기타"]
    let menuNames: [[InfoMenuModel]] = InfoMenuModel.dummyData()
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
        setTabBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        registerCells()
        setDelegate()
    }
}

extension MyInfoViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .clear
        
        infoCollectionView.do {
            $0.backgroundColor = .clear
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(infoCollectionView)
        
        infoCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "내 정보"
    }
    
    private func setTabBar() {
        tabBarController?.tabBar.isHidden = true
    }
    
    private func registerCells() {
        infoCollectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.cellIdentifier)
        infoCollectionView.register(InfoMenuCollectionViewCell.self, forCellWithReuseIdentifier: InfoMenuCollectionViewCell.cellIdentifier)
        infoCollectionView.register(MyInfoHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MyInfoHeaderView.reuseIdentifier)
        infoCollectionView.register(MyInfoFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MyInfoFooterView.reuseIdentifier)
    }
    
    private func setDelegate() {
        infoCollectionView.dataSource = self
        infoCollectionView.delegate = self
    }
    
    private func setProfileImageActions() {
        let alertVC = UIAlertController(title: "프로필 이미지 변경", message: nil, preferredStyle: .actionSheet)
        let changeImageAction = UIAlertAction(title: "프로필 이미지 변경", style: .default) { _ in
            self.changeImageButtonDidTap()
        }
        let deleteImageAction = UIAlertAction(title: "프로필 이미지 삭제", style: .default) { _ in
            self.deleteImageButtonDidTap()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alertVC.addActions(changeImageAction, deleteImageAction, cancelAction)
        
        present(alertVC, animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc private func changeImageButtonDidTap() {
        var configuation = PHPickerConfiguration()
        configuation.filter = .any(of: [.images])
        
        let picker = PHPickerViewController(configuration: configuation)
        picker.delegate = self
        picker.modalPresentationStyle = .overFullScreen
        self.present(picker, animated: true)
    }
    
    @objc private func deleteImageButtonDidTap() {
        setAlertWithAnimation("프로필 변경 완료")
    }
}

// MARK: - UICollectionViewDataSource

extension MyInfoViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categoryNames.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return categoryNames[section-1].count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.cellIdentifier, for: indexPath) as! ProfileCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoMenuCollectionViewCell.cellIdentifier, for: indexPath) as! InfoMenuCollectionViewCell
            cell.setDataBind(menuNames[indexPath.section-1][indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MyInfoHeaderView.reuseIdentifier, for: indexPath) as! MyInfoHeaderView
            header.setDataBind(categoryNames[indexPath.section-1])
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MyInfoFooterView.reuseIdentifier, for: indexPath)
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize()
        } else {
            let width = UIScreen.main.bounds.width
            return CGSize(width: width, height: 70)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize()
        } else {
            let width = UIScreen.main.bounds.width
            return CGSize(width: width, height: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            if indexPath.item == 0 {
                let navVC = UINavigationController(rootViewController: SetNicknameViewController())
                navVC.modalPresentationStyle = .overFullScreen
                present(navVC, animated: true)
            } else if indexPath.item == 1 {
                setProfileImageActions()
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MyInfoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        if indexPath.section == 0 {
            return CGSize(width: width, height: 100)
        } else {
            return CGSize(width: width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
}

// MARK: - PHPickerViewControllerDelegate

extension MyInfoViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
    }
}
