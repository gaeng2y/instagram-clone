//
//  MainTabController.swift
//  InstagramFirebaseTutorial
//
//  Created by gaeng on 2022/08/15.
//

import UIKit

class MainTabController: UITabBarController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    // MARK: - Helpers
    func configureViewControllers() {
        view.backgroundColor = .white
        
        tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        
        let feed = FeedController()
        
        let search = SearchController()
        
        let imageSelector = ImageSelectorController()
        
        let notification = NotificationController()
        
        let profile = ProfileController()
        
        viewControllers = [feed, search, imageSelector, notification, profile]
    }
}
