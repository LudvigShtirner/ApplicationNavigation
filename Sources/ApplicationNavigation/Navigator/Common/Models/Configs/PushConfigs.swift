//
//  PushConfigs.swift
//  
//
//  Created by Алексей Филиппов on 21.03.2023.
//

// Apple
import UIKit

/// Модель для настройки пуш открытия экрана
public struct PushOpenConfig {
    // MARK: - Data
    /// Стек навигации
    let navigationController: UINavigationController
    /// Флаг наличия анимации
    let animated: Bool
    /// Флаг замены стека навигации
    let replaceStack: Bool
    
    // MARK: - Inits
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

/// Модель для настройки закрытия
public struct PushCloseConfig {
    // MARK: - Data
    /// Стек контроллеров
    let navigationController: UINavigationController
    /// Флаг наличия анимации
    let animated: Bool
    
    // MARK: - Inits
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
