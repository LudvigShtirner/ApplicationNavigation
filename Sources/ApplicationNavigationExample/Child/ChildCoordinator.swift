//
//  ChildCoordinator.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 10.11.2021.
//

// Subprojects
import ApplicationNavigation

// Apple
import UIKit

final class ChildCoordinator: BaseCoordinator, IBaseCoordinator {
    // MARK: - Dependencies
    private let moduleFactory: ChildModuleFactory
    
    // MARK: - Inits
    init(moduleFactory: ChildModuleFactory,
         closeType: CloserType) {
        self.moduleFactory = moduleFactory
        super.init(closeType: closeType)
    }
    
    // MARK: - IBaseCoordinator
    func createModule() -> UIViewController {
        let module = moduleFactory.buildModule()
        let viewController = module.viewController
        module.coordinatorInteractor.onClose { [weak self, weak viewController] in
            guard let self = self, let viewController = viewController else { return }
            self.finishFlow(viewController: viewController)
        }
        return viewController
    }
}
