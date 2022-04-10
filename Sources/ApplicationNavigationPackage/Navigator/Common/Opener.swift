//
//  Opener.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 24.09.2021.
//

// Subprojects
import SupportCode

// Apple
import UIKit

/// Протокол объекта, открывающего контроллеры отображений
protocol Opener {
    /// Показать отображение
    /// - Parameter viewController: контроллер отображения
    /// - Parameter completion: блок, вызываемый после показа
    func show(_ viewController: UIViewController,
              completion: VoidBlock?)
}
