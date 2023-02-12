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
    
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private let containerView: UIView = UIView()
    
    // MARK: - Properties
    
    let menuNameList: [String] = ["게시판", "진로", "홍보", "단체"]
     
    // MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        view.addSubviews(menuCollectionView, containerView)
        
        let boardVC = BoardMenuViewController()
        addChild(boardVC)
        
        containerView.addSubview(boardVC.view)

        menuCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(70)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }
    
    private func setContainerView(_ viewController: UIViewController) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
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
        
        if indexPath.row == 0 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let boardVC = BoardMenuViewController()
            setContainerView(boardVC)
        case 1:
            let careerVC = CareerMenuViewController()
            setContainerView(careerVC)
        case 2:
            let advertiseVC = AdvertiseMenuViewController()
            setContainerView(advertiseVC)
        case 3:
            let groupVC = GroupMenuViewController()
            setContainerView(groupVC)
        default:
            break
        }
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
