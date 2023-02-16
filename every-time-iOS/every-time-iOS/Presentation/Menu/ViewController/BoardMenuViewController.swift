//
//  BoardMenuViewController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/12.
//

import UIKit

import SnapKit
import Then

final class BoardMenuViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    // MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setDelegate()
    }
}

extension BoardMenuViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        menuCollectionView.do {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsVerticalScrollIndicator = false
            $0.register(MainMenuCollectionViewCell.self, forCellWithReuseIdentifier: MainMenuCollectionViewCell.cellIdentifier)
            $0.register(PinMenuCollectionViewCell.self, forCellWithReuseIdentifier: PinMenuCollectionViewCell.cellIdentifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(menuCollectionView)
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension BoardMenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMenuCollectionViewCell.cellIdentifier, for: indexPath) as! MainMenuCollectionViewCell
            cell.delegate = self
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PinMenuCollectionViewCell.cellIdentifier, for: indexPath) as! PinMenuCollectionViewCell
            cell.delegate = self
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension BoardMenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        switch indexPath.row {
        case 0:
            return CGSize(width: width, height: 250)
        case 1:
            return CGSize(width: width, height: 338)
        default:
            return CGSize()
        }
    }
}

// MARK: - MainMenuTableViewCellDelegate

extension BoardMenuViewController: MainMenuTableViewCellDelegate, PinMenuTableViewCellDelegate {

    func mainMenuCellDidSelected() {
        let detailBoardVC = DetailBoardViewController()
        navigationController?.pushViewController(detailBoardVC, animated: true)
    }
    
    func pinMenuCellDidSelected() {
        let boardVC = BoardViewController()
        navigationController?.pushViewController(boardVC, animated: true)
    }
}
