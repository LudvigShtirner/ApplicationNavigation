//
//  ModalOpener.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 24.09.2021.
//

// Subprojects
import SupportCode

// Apple
import UIKit

/// Навигатор для модального показа отображений
final class ModalOpener: Opener {
    // MARK: - Data
    /// Контроллер, с которого модально открывается новый контроллер
    private weak var presentingVC: UIViewController?
    /// Флаг наличия анимации
    private let animated: Bool
    /// Стиль открытия
    private let modalPresentationStyle: UIModalPresentationStyle
    
    private let modalTransitionStyle: UIModalTransitionStyle
    
    // MARK: - Inits
    /// Конструктор навигатора для модального показа отображения
    /// - Parameters:
    ///   - presentingVC: исходный контроллер отображения
    ///   - animated: Флаг наличия анимации
    ///   - modalPresentationStyle: Стиль открытия
    init(presentingVC: UIViewController,
         animated: Bool = true,
         modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
         modalTransitionStyle: UIModalTransitionStyle = .coverVertical) {
        self.presentingVC = presentingVC
        self.animated = animated
        self.modalPresentationStyle = modalPresentationStyle
        self.modalTransitionStyle = modalTransitionStyle
    }
    
    // MARK: - Opener
    func show(_ viewController: UIViewController,
              completion: VoidBlock?) {
        viewController.modalPresentationStyle = modalPresentationStyle
        viewController.modalTransitionStyle = modalTransitionStyle
        presentingVC?.present(viewController,
                              animated: animated,
                              completion: completion)
    }
}
