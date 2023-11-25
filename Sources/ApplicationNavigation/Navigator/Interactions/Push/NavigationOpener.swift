//
//  NavigationOpener.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 26.09.2021.
//

// Subprojects
import SupportCode

// Apple
import UIKit

/// Навигатор добавления контроллера в стек навигации
final class NavigationOpener: Opener {
    // MARK: - Data
    /// Стек навигации
    private weak var navigationController: UINavigationController?
    /// Флаг наличия анимации
    private let animated: Bool
    /// Флаг замены текущего стека контроллера
    private let replaceStack: Bool
    
    // MARK: - Inits
    /// Конструктор навигатора добавления контроллера в стек навигации
    /// - Parameters:
    ///   - navigationController: Стек навигации
    ///   - animated: Флаг наличия анимации
    ///   - replaceStack: Флаг замены текущего стека контроллера
    init(navigationController: UINavigationController,
         animated: Bool,
         replaceStack: Bool) {
        self.navigationController = navigationController
        self.animated = animated
        self.replaceStack = replaceStack
    }
    
    // MARK: - Navigator
    func show(_ viewController: UIViewController,
              completion: ResultBlock<Void>?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock({ [weak viewController] in
            if viewController?.navigationController != nil {
                completion?(.success)
            } else {
                completion?(.failure(PushError.isNotInStack))
            }
        })
        defer {
            CATransaction.commit()
        }
        if replaceStack {
            navigationController?.setViewControllers([viewController],
                                                     animated: animated)
            return
        }
        navigationController?.pushViewController(viewController,
                                                 animated: animated)
    }
}

public enum PushError: Error {
    case isNotInStack
}
