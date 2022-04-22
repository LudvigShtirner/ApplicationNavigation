//
//  CloserType.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 06.11.2021.
//

// Apple
import UIKit

/// Перечисление типов скрытия
public enum CloserType {
    /// Скрытие контроллера как корня окна
    case root
    /// Скрытие контроллера с помощью пуша в стек контроллеров
    case push(PushCloseConfig)
    /// Скрытие контроллера модально
    case modal(ModalCloseConfig)
}

/// Модель для настройки модального перехода
public struct ModalCloseConfig {
    // MARK: - Data
    /// Флаг наличия анимации
    let animated: Bool
    
    // MARK: - Life cycle
    /// Конструктор создания модели
    /// - Parameters:
    ///   - animated: флаг анимации
    public init(animated: Bool = true) {
        self.animated = animated
    }
}

/// Модель для настройки закрытия
public struct PushCloseConfig {
    // MARK: - Data
    /// Стек контроллеров
    let navigationController: UINavigationController
    /// Флаг наличия анимации
    let animated: Bool
    
    /// Конструктор создания модели
    /// - Parameters:
    ///   - navigationController: Стек контроллеров
    ///   - animated: флаг анимации
    public init(navigationController: UINavigationController,
                animated: Bool = true) {
        self.animated = animated
        self.navigationController = navigationController
    }
}
