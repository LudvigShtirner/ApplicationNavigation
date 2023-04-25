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
    /// Скрытие контроллера падающей анимацией
    case fall(FallCloseConfig)
    /// Скрытие контроллера из списка табов
    case tab(TabCloseConfig)
}
