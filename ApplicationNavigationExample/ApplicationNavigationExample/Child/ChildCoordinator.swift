//
//  ChildCoordinator.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 10.11.2021.
//

// Subprojects
import ApplicationNavigationPackage

// Apple
import UIKit

final class ChildCoordinator: BaseCoordinator {
    // MARK: - Dependencies
    private let moduleFactory: ChildModuleFactory
    
    // MARK: - Data
    private let closerType: CloserType
    
    // MARK: - Life Cycle
    init(moduleFactory: ChildModuleFactory,
         closerType: CloserType) {
        self.moduleFactory = moduleFactory
        self.closerType = closerType
        super.init()
    }
    
    // MARK: - BaseCoordinator
    override func createModule() -> UIViewController {
        let module = moduleFactory.buildModule()
        let viewController = module.viewController
        module.coordinatorInteractor.onClose { [weak self, weak viewController] in
            guard let self = self, let viewController = viewController else { return }
            self.finishFlow(viewController: viewController,
                            closeType: self.closerType)
        }
        return viewController
    }
}
