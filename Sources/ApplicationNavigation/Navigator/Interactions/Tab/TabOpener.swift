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
              completion: ResultBlock<Void>?) {
        if let navController = viewController as? UINavigationController {
            navController.topViewController?.title = config.title
        } else {
            viewController.title = config.title
        }
        viewController.tabBarItem = config.tabBarItem
        let currentTabs = config.tabBar.viewControllers ?? []
        let updatedTabs = currentTabs + [viewController]
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({ [weak viewController] in
            if viewController?.tabBarController != nil {
                completion?(.success)
            } else {
                completion?(.failure(PushError.isNotInStack))
            }
        })
        config.tabBar.setViewControllers(updatedTabs,
                                         animated: config.animated)
        CATransaction.commit()
    }
}
