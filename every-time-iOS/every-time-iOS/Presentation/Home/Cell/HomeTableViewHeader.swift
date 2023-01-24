//
//  HomeTableViewHeader.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/24.
//

import UIKit

import SnapKit
import Then

final class HomeTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    private let eventCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private let bannerImageView: UIImageView = UIImageView()
    
    // MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeTableViewHeader {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        eventCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: EventCollectionViewCell.cellIdentifier)
        }
        
        menuCollectionView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.cellIdentifier)
        }
        
        bannerImageView.do {
            $0.backgroundColor = .systemPink
            $0.layer.cornerRadius = 7
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(eventCollectionView, menuCollectionView, bannerImageView)
        
        eventCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200.adjusted)
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(eventCollectionView.snp.bottom)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(100.adjusted)
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-5)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        eventCollectionView.dataSource = self
        eventCollectionView.delegate = self
        
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource

extension HomeTableViewHeader: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == eventCollectionView {
            return 3
        } else if collectionView == menuCollectionView {
            return 7
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == eventCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.cellIdentifier, for: indexPath)
            return cell
        } else if collectionView == menuCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.cellIdentifier, for: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeTableViewHeader: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == eventCollectionView {
            let width = UIScreen.main.bounds.width - 100
            let height = eventCollectionView.frame.height - 20
            return CGSize(width: width, height: height)
        } else {
            let screenWidth = UIScreen.main.bounds.width
            let cellWidth = screenWidth - 20 - 7 * 6
            let height = menuCollectionView.frame.height - 20
            return CGSize(width: cellWidth/7, height: height)
        }
    }
}
