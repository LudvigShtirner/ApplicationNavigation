//
//  FallCloser.swift
//  
//
//  Created by Алексей Филиппов on 14.11.2022.
//

// SupportCode
import SupportCode

// Apple
import UIKit

/// Навигатор для кастомного скрытия контроллера падающего типа
final class FallCloser: NSObject, Closer {
    // MARK: - Data
    /// Кастомный аниматор скрытия
    private let fallCloserAnimator: FallCloserAnimator
    
    // MARK: - Inits
    /// Конструктор навигатора модального скрытия отображения
    /// - Parameters:
    ///   - animated: флаг наличия анимации
    init(duration: TimeInterval) {
        self.fallCloserAnimator = .init(duration: duration)
        super.init()
    }
    
    // MARK: - Closer
    func hide(_ viewController: UIViewController,
              completion: VoidBlock?) {
        viewController.transitioningDelegate = self
        viewController.dismiss(animated: true,
                               completion: completion)
    }
}

extension FallCloser: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        fallCloserAnimator
    }
}
