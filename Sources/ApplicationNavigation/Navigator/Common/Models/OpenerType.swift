//
//  OpenerType.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 06.11.2021.
//

// Apple
import UIKit

/// Перечисление типов открытия
public enum OpenerType {
    /// Показ контроллера как корня окна
    case root(UIWindow)
    /// Показ контроллера с помощью пуша в стек контроллеров
    case push(PushOpenConfig)
    /// Показ контроллера модально
    case modal(ModalOpenConfig)
}

/// Модель для настройки модального перехода
public struct ModalOpenConfig {
    // MARK: - Data
    /// Исходный контроллер отображения
    public let presentingController: UIViewController
    /// Флаг наличия анимации
    public let animated: Bool
    /// Стиль открытия
    public let modalPresentationStyle: UIModalPresentationStyle
    
    // MARK: - Life cycle
    /// Конструктор создания модели
    /// - Parameters:
    ///   - presentingController: контроллер, с которого будет открыт новый контроллер
    ///   - animated: флаг наличия анимации
    ///   - modalPresentationStyle: стиль открытия контроллера
    public init(presentingController: UIViewController,
                animated: Bool = true,
                modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
        self.presentingController = presentingController
        self.animated = animated
        self.modalPresentationStyle = modalPresentationStyle
    }
}

/// Модель для настройки пуш открытия экрана
public struct PushOpenConfig {
    // MARK: - Data
    /// Стек навигации
    public let navigationController: UINavigationController
    /// Флаг наличия анимации
    public let animated: Bool
    /// Флаг замены стека навигации
    public let replaceStack: Bool
    
    // MARK: - Life Cycle
    /// Конструктор создания модели
    /// - Parameters:
    ///   - navigationController: стек контроллеров
    ///   - animated: флаг наличия анимации
    ///   - replaceStack: флаг замены всех контроллеров в стеке на новый
    public init(navigationController: UINavigationController,
                animated: Bool = true,
                replaceStack: Bool = false) {
        self.navigationController = navigationController
        self.animated = animated
        self.replaceStack = replaceStack
    }
}
