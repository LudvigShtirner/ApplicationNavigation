//
//  FallOpener.swift
//  
//
//  Created by Алексей Филиппов on 14.11.2022.
//

// Subprojects
import SupportCode

// Apple
import UIKit

/// Навигатор для кастомного открытия контроллера падающего типа
final class FallOpener: NSObject, Opener {
    // MARK: - Data
    /// Контроллер, с которого модально открывается новый контроллер
    private weak var presentingVC: UIViewController?
    /// Стиль открытия
    private let modalPresentationStyle: UIModalPresentationStyle
    /// Кастомный аниматор открытия
    private let fallOpenerAnimator: FallOpenerAnimator
    
    // MARK: - Life Cycle
    /// Конструктор навигатора для модального показа отображения
    /// - Parameters:
    ///   - presentingVC: исходный контроллер отображения
    ///   - duration: Длительность анимации
    ///   - modalPresentationStyle: Стиль открытия
    init(presentingVC: UIViewController,
         duration: TimeInterval,
         modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
        self.presentingVC = presentingVC
        self.modalPresentationStyle = modalPresentationStyle
        self.fallOpenerAnimator = .init(duration: duration)
        super.init()
    }
    
    // MARK: - Opener
    func show(_ viewController: UIViewController,
              completion: VoidBlock?) {
        viewController.modalPresentationStyle = modalPresentationStyle
        viewController.transitioningDelegate = self
        presentingVC?.present(viewController,
                              animated: true,
                              completion: completion)
    }
}

extension FallOpener: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return fallOpenerAnimator
    }
}
