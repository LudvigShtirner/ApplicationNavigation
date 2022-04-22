//
//  RootCloser.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 25.09.2021.
//

// Subprojects
import SupportCode

// Apple
import UIKit

/// навигатор для скрытия UIWindow
final class RootCloser: Closer {
    // MARK: - Closer
    public func hide(_ viewController: UIViewController,
                     completion: VoidBlock?) {
        viewController.view.window?.rootViewController = nil
        completion?()
    }
}
