//
//  Closer.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 24.09.2021.
//

// Subprojects
import SupportCodePackage

// Apple
import UIKit

/// Протокол объекта, закрывающего контроллеры отображений
protocol Closer {
    /// Скрыть отображение
    /// - Parameter viewController: контроллер отображения
    /// - Parameter completion: блок, вызываемый после скрытия
    func hide(_ viewController: UIViewController,
              completion: VoidBlock?)
}

/// Расширение протокола для удобного вызова дефолтного метода скрытия отображения
extension Closer {
    /// Скрыть отображение
    /// - Parameter viewController: контроллер отображения
    func hide(_ viewController: UIViewController) {
        hide(viewController,
             completion: nil)
    }
}
