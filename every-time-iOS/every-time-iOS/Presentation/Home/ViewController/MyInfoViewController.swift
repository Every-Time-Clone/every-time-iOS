//
//  MyInfoViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/04/15.
//

import UIKit

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

    // MARK: - Initializer
    
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
}

// MARK: - UICollectionViewDataSource

extension MyInfoViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.cellIdentifier, for: indexPath) as! ProfileCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoMenuCollectionViewCell.cellIdentifier, for: indexPath) as! InfoMenuCollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MyInfoHeaderView.reuseIdentifier, for: indexPath)
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
            return CGSize(width: width, height: 70)
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
