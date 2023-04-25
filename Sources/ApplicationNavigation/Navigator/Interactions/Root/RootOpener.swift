//
//  RootOpener.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 25.09.2021.
//

// Subprojects
import SupportCode

// Apple
import UIKit

/// Навигатор для показа корневого отображения для окна
final class RootOpener: Opener {
    // MARK: - Dependencies
    /// Окно отображений
    private let window: UIWindow
    
    // MARK: - Inits
    /// Конструктор навигатора
    /// - Parameter window: Окно отображений
    public init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Opener
    public func show(_ viewController: UIViewController,
                     completion: VoidBlock?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        completion?()
    }
}
