//
//  TabOpener.swift
//  
//
//  Created by Алексей Филиппов on 21.03.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

struct TabOpener: Opener {
    // MARK: - Data
    let config: TabOpenConfig
    
    // MARK: - Opener
    func show(_ viewController: UIViewController,
              completion: VoidBlock?) {
        if let navController = viewController as? UINavigationController {
            navController.topViewController?.title = config.title
        } else {
            viewController.title = config.title
        }
        viewController.tabBarItem = config.tabBarItem
        let currentTabs = config.tabBar.viewControllers ?? []
        let updatedTabs = currentTabs + [viewController]
        config.tabBar.setViewControllers(updatedTabs,
                                         animated: config.animated)
    }
}
