//
//  CustomTabBarController.swift
//  CurvedTabbar
//
//  Created by Chirag Gujarati on 01/12/24.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var mainButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarItems()
        self.delegate = self
    }
    
    private func setupFAB() {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseBackgroundColor = .systemBlue
        buttonConfig.image = UIImage(systemName: "2.circle")
        
        buttonConfig.imagePlacement = .all
        buttonConfig.imagePadding = 15
        buttonConfig.cornerStyle = .capsule
        
        mainButton.configuration = buttonConfig
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.addTarget(self, action: #selector(tab2Selected), for: .touchUpInside)
        
        self.tabBar.addSubview(mainButton)
        
        NSLayoutConstraint.activate([
            mainButton.centerXAnchor.constraint(equalTo: self.tabBar.centerXAnchor),
            mainButton.widthAnchor.constraint(equalToConstant: 56),
            mainButton.heightAnchor.constraint(equalToConstant: 56),
            mainButton.bottomAnchor.constraint(equalTo: self.tabBar.bottomAnchor, constant: -44)
        ])
    }

    @objc private func tab2Selected() {
        //Do Any for 2nd Tab selection
    }
    
    //MARK: - Create View Controllers and apply to tabbar
    fileprivate func createTabBarItems(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tab1Controller = storyboard.instantiateViewController(withIdentifier: "Tab1")
        let nav0 = UINavigationController(rootViewController: tab1Controller)
        nav0.tabBarItem = UITabBarItem(title: "1", image: UIImage(systemName: "1.circle"), selectedImage: UIImage(systemName: "1.circle.fill"))
        let nav1 = UINavigationController()
        nav1.tabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
        
        let tab2Controller = storyboard.instantiateViewController(withIdentifier: "Tab3")
        let nav2 = UINavigationController(rootViewController: tab2Controller)
        nav2.tabBarItem = UITabBarItem(title: "3", image: UIImage(systemName: "3.circle"), selectedImage: UIImage(systemName: "3.circle.fill"))
        
        nav0.navigationBar.isHidden = true
        nav1.navigationBar.isHidden = true
        nav2.navigationBar.isHidden = true
        
        UITabBar.appearance().tintColor = UIColor.blue
        
        self.viewControllers = [nav0, nav1, nav2]
        
        //Default selected 2nd tab
        selectedIndex = 1
        
        for tabBarItem in tabBar.items! where tabBarItem == nav1.tabBarItem {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
        }
        
        setupFAB()
    }
}
