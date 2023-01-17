//
//  TabBarController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/17.
//

import UIKit

class EverytimeTabBar: UITabBar {

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class EverytimeTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    private let everyTimeTabBar = EverytimeTabBar()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension EverytimeTabBarController {
    
    // MARK: - Config
    
    private func setUI() {
        view.backgroundColor = .white
        selectedIndex = defaultIndex
        setValue(everyTimeTabBar, forKey: "tabBar")
        object_setClass(tabBar, EverytimeTabBar.self)
        tabBar.itemPositioning = .centered
        tabBar.clearShadow()
        tabBar.layer.applyShadow(color: .black, alpha: 0.5, x: 0, y: 0, blur: 2)
    }
}

// MARK: - UITabBarControllerDelegate

extension EverytimeTabBarController: UITabBarControllerDelegate {
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        
        let timetableViewController = TImetableViewController()
        let timetableNavigationController = UINavigationController(rootViewController: timetableViewController)
        
        let menuViewController = MenuViewController()
        let menuNavigationController = UINavigationController(rootViewController: menuViewController)
        
        let notificationViewController = NotificationViewController()
        let notificationNavigationController = UINavigationController(rootViewController: notificationViewController)
        
        let campusPickViewController = CampusPickViewController()
        
        let viewControllers = [
            homeNavigationController,
            timetableNavigationController,
            menuNavigationController,
            notificationNavigationController,
            campusPickViewController
        ]
        
        setViewControllers(viewControllers, animated: true)
        
        let tabBar: UITabBar = tabBar
        tabBar.backgroundColor = .white
        tabBar.barStyle = UIBarStyle.default
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = .black

        let imageNames = [
            "house",
            "tablecells",
            "menucard",
            "bell",
            "icloud"
        ]

        let imageSelectedNames = [
            "house.fill",
            "tablecells.fill",
            "menucard.fill",
            "bell.fill",
            "icloud.fill"
        ]

        for (index, value) in (tabBar.items?.enumerated())! {
            let tabBarItem: UITabBarItem = value as UITabBarItem

            tabBarItem.image = UIImage(systemName: imageNames[index])
            tabBarItem.selectedImage = UIImage(systemName: imageSelectedNames[index])
        }
    }
}
