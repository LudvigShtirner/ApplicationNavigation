//
//  TabConfigs.swift
//  
//
//  Created by Алексей Филиппов on 21.03.2023.
//

// Apple
import UIKit

public struct TabOpenConfig {
    // MARK: - Data
    let tabBar: UITabBarController
    let tabBarItem: UITabBarItem
    let title: String
    let animated: Bool
    
    // MARK: - Inits
    public init(tabBar: UITabBarController,
                tabBarItem: UITabBarItem,
                title: String,
                animated: Bool = true) {
        self.tabBar = tabBar
        self.tabBarItem = tabBarItem
        self.title = title
        self.animated = animated
    }
}

public struct TabCloseConfig {
    // MARK: - Data
    let tabBar: UITabBarController
    let animated: Bool
    
    // MARK: - Inits
    public init(tabBar: UITabBarController,
                animated: Bool = true) {
        self.tabBar = tabBar
        self.animated = animated
    }
}
