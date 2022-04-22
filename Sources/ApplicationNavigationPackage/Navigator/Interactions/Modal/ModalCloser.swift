//
//  ModalCloser.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 24.09.2021.
//

// Subprojects
import SupportCodePackage

// Apple
import UIKit

/// Навигатор для модального скрытия отображения
final class ModalCloser: Closer {
    // MARK: - Data
    /// Флаг анимации при скрытии
    private let animated: Bool
    
    // MARK: - Life Cycle
    /// Конструктор навигатора модального скрытия отображения
    /// - Parameters:
    ///   - animated: флаг наличия анимации
    init(animated: Bool = true) {
        self.animated = animated
    }
    
    // MARK: - Closer
    func hide(_ viewController: UIViewController,
              completion: VoidBlock?) {
        viewController.dismiss(animated: animated,
                               completion: completion)
    }
}
