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
    /// Показ контроллера падающей анимацией
    case fall(FallOpenConfig)
    /// Показ контроллера в списке табов
    case tab(TabOpenConfig)
}
