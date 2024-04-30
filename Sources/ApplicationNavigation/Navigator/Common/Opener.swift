//
//  Opener.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 24.09.2021.
//

// SPM
import SupportCode
// Apple
import UIKit

/// Протокол объекта, открывающего контроллеры отображений
public protocol Opener {
    /// Показать отображение
    /// - Parameter viewController: контроллер отображения
    /// - Parameter completion: блок, вызываемый после показа
    func show(_ viewController: UIViewController,
              completion: ResultBlock<Void>?)
}

public extension Opener {
    /// Показать отображение
    /// - Parameter viewController: контроллер отображения
    func show(_ viewController: UIViewController) {
        show(viewController,
             completion: nil)
    }
}
