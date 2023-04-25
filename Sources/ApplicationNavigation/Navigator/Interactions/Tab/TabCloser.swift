//
//  TabCloser.swift
//  
//
//  Created by Алексей Филиппов on 21.03.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

struct TabCloser: Closer {
    // MARK: - Data
    let config: TabCloseConfig
    
    // MARK: - Closer
    func hide(_ viewController: UIViewController,
              completion: VoidBlock?) {
        let currentTabs = config.tabBar.viewControllers ?? []
        let updatedTabs = currentTabs.filter { $0 != viewController }
        config.tabBar.setViewControllers(updatedTabs,
                                         animated: config.animated)
    }
}

