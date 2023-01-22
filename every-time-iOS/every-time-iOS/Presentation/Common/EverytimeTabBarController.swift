//
//  TabBarController.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/17.
//

import UIKit

class EverytimeTabBarController: UITabBarController {
    
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
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.itemPositioning = .centered
        tabBar.clearShadow()
        tabBar.layer.applyShadow(color: .black, alpha: 0.5, x: 0, y: 0, blur: 2)
        
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        homeNavigationController.navigationBar.isHidden = true

        let timetableViewController = TImetableViewController()
        let timetableNavigationController = UINavigationController(rootViewController: timetableViewController)
        timetableNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "tablecells"), selectedImage: UIImage(systemName: "tablecells.fill"))

        let menuViewController = MenuViewController()
        let menuNavigationController = UINavigationController(rootViewController: menuViewController)
        menuNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"))

        let notificationViewController = NotificationViewController()
        let notificationNavigationController = UINavigationController(rootViewController: notificationViewController)
        notificationNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bell"), selectedImage: UIImage(systemName: "bell.fill"))

        let campusPickViewController = CampusPickViewController()
        campusPickViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "icloud"), selectedImage: UIImage(systemName: "icloud.fill"))
        
        let viewControllers = [
            homeNavigationController,
            timetableNavigationController,
            menuNavigationController,
            notificationNavigationController,
            campusPickViewController
        ]
        
        for vc in viewControllers {
            vc.view.backgroundColor = .white
        }

        setViewControllers(viewControllers, animated: true)
    }
}
