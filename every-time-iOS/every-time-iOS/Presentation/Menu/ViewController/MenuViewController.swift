//
//  MenuViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/17.
//

import UIKit

import SnapKit
import Then

final class MenuViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    // MARK: - Properties
    
    private let menuNameList: [String] = ["게시판", "진로", "홍보", "단체"]
    
    // MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setDelegate()
    }
}

extension MenuViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = true
        
        menuCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.showsHorizontalScrollIndicator = false
            $0.register(MenuTabCollectionViewCell.self, forCellWithReuseIdentifier: MenuTabCollectionViewCell.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubview(menuCollectionView)

        menuCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(70)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource

extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuNameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuTabCollectionViewCell.cellIdentifier, for: indexPath) as! MenuTabCollectionViewCell
        cell.setDataBind(menuNameList[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = menuNameList[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width + 10, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(17)
    }
}
