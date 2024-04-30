//
//  NavigationCloser.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 26.09.2021.
//

// Subprojects
import SupportCode

// Apple
import UIKit

/// Навигатор для скрытия контроллера из стека навигации
final class NavigationCloser: Closer {
    // MARK: - Data
    /// Стек навигации
    private weak var navigationController: UINavigationController?
    /// Флаг наличия анимации
    private let animated: Bool
    
    // MARK: - Inits
    /// Конструктор скрытия контроллера из стека навигации
    /// - Parameters:
    ///   - navigationController: Стек навигации
    ///   - animated: Флаг наличия анимации
    init(navigationController: UINavigationController,
         animated: Bool) {
        self.navigationController = navigationController
        self.animated = animated
    }
    
    // MARK: - Navigator
    func hide(_ viewController: UIViewController,
              completion: VoidBlock?) {
        guard let navigationVC = navigationController,
              let index = navigationVC.viewControllers.firstIndex(of: viewController) else {
            return
        }
        switch index {
        case 0:
            assertionFailure("\(viewController) is RootViewController. Use another closer to hide")
        case 1:
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            navigationVC.popToRootViewController(animated: animated)
            CATransaction.commit()
        default:
            let newTopVC = navigationVC.viewControllers[index - 1]
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            navigationVC.popToViewController(newTopVC, animated: animated)
            CATransaction.commit()
        }
    }
}
