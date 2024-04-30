//
//  IBaseCoordinator.swift
//
//
//  Created by Алексей Филиппов on 21.04.2024.
//

// SPM
import SupportCode
// Apple
import UIKit

public protocol IBaseCoordinator: BaseCoordinator {
    /// Make UI module view
    /// - Returns: Module View
    func createModule() -> UIViewController
    
    /// Запустить координатор следующего модуля
    /// - Parameters:
    ///   - coordinator: координатор нового модуля
    ///   - openType: тип открытия нового модуля
    ///   - presentCompletion: блок действий при отображении viewController
    ///   - flowCompletion: блок действий при уничтожении координатора
    func runNextFlow(coordinator: IBaseCoordinator,
                     openType: OpenerType,
                     presentCompletion: ResultBlock<Void>?,
                     flowCompletion: VoidBlock?)
}

public extension IBaseCoordinator {
    func runNextFlow(coordinator: IBaseCoordinator,
                     openType: OpenerType) {
        runNextFlow(coordinator: coordinator,
                    openType: openType,
                    presentCompletion: nil,
                    flowCompletion: nil)
    }
    
    func runNextFlow(coordinator: IBaseCoordinator,
                     openType: OpenerType,
                     presentCompletion: ResultBlock<Void>?) {
        runNextFlow(coordinator: coordinator,
                    openType: openType,
                    presentCompletion: presentCompletion,
                    flowCompletion: nil)
    }
    
    func runNextFlow(coordinator: IBaseCoordinator,
                     openType: OpenerType,
                     flowCompletion: VoidBlock?) {
        runNextFlow(coordinator: coordinator,
                    openType: openType,
                    presentCompletion: nil,
                    flowCompletion: flowCompletion)
    }
    
    func runNextFlow(coordinator: IBaseCoordinator,
                     openType: OpenerType,
                     presentCompletion: ResultBlock<Void>? = nil,
                     flowCompletion: VoidBlock? = nil) {
        addDependency(coordinator)
        coordinator.completionHandler = { [weak self, weak coordinator] in
            flowCompletion?()
            self?.removeDependency(coordinator)
        }
        let viewController = coordinator.createModule()
        let opener = navigatorFactory.makeOpener(type: openType)
        opener.show(viewController,
                    completion: presentCompletion)
    }
}
