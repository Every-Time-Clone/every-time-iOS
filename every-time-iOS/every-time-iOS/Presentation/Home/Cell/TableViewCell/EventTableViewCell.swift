//
//  EventTableViewCell.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/23.
//

import UIKit

import SnapKit
import Then

final class EventTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let eventCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        selectionStyle = .none
        
        contentView.backgroundColor = .clear
        
        eventCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: EventCollectionViewCell.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(eventCollectionView)
        
        eventCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        eventCollectionView.dataSource = self
        eventCollectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource

extension EventTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.cellIdentifier, for: indexPath)
        return cell
    }
}

extension EventTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 100
        let height = contentView.frame.height - 20
        return CGSize(width: width, height: height)
    }
}
