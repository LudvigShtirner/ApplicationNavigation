//
//  FallConfigs.swift
//  
//
//  Created by Алексей Филиппов on 21.03.2023.
//

// Apple
import UIKit

/// Модель для настройки падающей анимации
public struct FallOpenConfig {
    // MARK: - Data
    /// Исходный контроллер отображения
    let presentingController: UIViewController
    /// Длительность анимации
    let duration: TimeInterval
    
    // MARK: - Inits
    /// Конструктор создания модели
    /// - Parameters:
    ///   - presentingController: Исходный контроллер отображения
    ///   - duration: Длительность анимации
    public init(presentingController: UIViewController,
                duration: TimeInterval) {
        self.presentingController = presentingController
        self.duration = duration
    }
}

/// Модель для настройки падающей анимации
public struct FallCloseConfig {
    // MARK: - Data
    /// Длительность анимации
    let duration: TimeInterval
    
    // MARK: - Inits
    /// Конструктор создания модели
    /// - Parameter duration: Длительность анимации
    public init(duration: TimeInterval) {
        self.duration = duration
    }
}
