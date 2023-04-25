//
//  ModalConfigs.swift
//  
//
//  Created by Алексей Филиппов on 21.03.2023.
//

// Apple
import UIKit

/// Модель для настройки модального перехода
public struct ModalOpenConfig {
    // MARK: - Data
    /// Исходный контроллер отображения
    let presentingController: UIViewController
    /// Флаг наличия анимации
    let animated: Bool
    /// Стиль открытия
    let modalPresentationStyle: UIModalPresentationStyle
    
    let modalTransitionStyle: UIModalTransitionStyle
    
    // MARK: - Inits
    /// Конструктор создания модели
    /// - Parameters:
    ///   - presentingController: контроллер, с которого будет открыт новый контроллер
    ///   - animated: флаг наличия анимации
    ///   - modalPresentationStyle: стиль открытия контроллера
    public init(presentingController: UIViewController,
                animated: Bool = true,
                modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                modalTransitionStyle: UIModalTransitionStyle = .coverVertical) {
        self.presentingController = presentingController
        self.animated = animated
        self.modalPresentationStyle = modalPresentationStyle
        self.modalTransitionStyle = modalTransitionStyle
    }
}

/// Модель для настройки модального перехода
public struct ModalCloseConfig {
    // MARK: - Data
    /// Флаг наличия анимации
    let animated: Bool
    
    // MARK: - Inits
    /// Конструктор создания модели
    /// - Parameters:
    ///   - animated: флаг анимации
    public init(animated: Bool = true) {
        self.animated = animated
    }
}
