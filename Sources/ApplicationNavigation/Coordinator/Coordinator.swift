//
//  Coordinator.swift
//
//
//  Created by Алексей Филиппов on 21.04.2024.
//

// Apple
import UIKit

public final class RootCoordinator: BaseCoordinator, IBaseCoordinator {
    public func createModule() -> UIViewController {
        UIViewController(nibName: nil, bundle: nil)
    }
}
