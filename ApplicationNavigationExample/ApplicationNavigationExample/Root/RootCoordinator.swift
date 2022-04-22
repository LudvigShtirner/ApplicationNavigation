//
//  RootCoordinator.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

// Subprojects
import ApplicationNavigation

// Apple
import UIKit

final class RootCoordinator: BaseCoordinator {
    // MARK: - Dependencies
    private let moduleFactory: RootModuleFactory
    private let childFlowFactory: ChildFlowFactory
    
    // MARK: - Life Cycle
    init(moduleFactory: RootModuleFactory,
         childFlowFactory: ChildFlowFactory) {
        self.moduleFactory = moduleFactory
        self.childFlowFactory = childFlowFactory
        super.init()
    }
    
    // MARK: - BaseCoordinator
    override func createModule() -> UIViewController {
        let module = moduleFactory.buildModule()
        let navigationViewController = UINavigationController(rootViewController: module.viewController)
        navigationViewController.isNavigationBarHidden = true
        module.coordinatorInteractor.onClose { [weak self, weak navigationViewController] in
            guard let navigationViewController = navigationViewController else { return }
            self?.finishFlow(viewController: navigationViewController,
                             closeType: .root)
        }
        module.coordinatorInteractor.onModal { [weak self, weak navigationViewController] in
            guard let navigationViewController = navigationViewController else { return }
            self?.runChildFlow(openerType: .modal(.init(presentingController: navigationViewController)))
        }
        module.coordinatorInteractor.onPush { [weak self, weak navigationViewController] in
            guard let navigationViewController = navigationViewController else { return }
            self?.runChildFlow(openerType: .push(.init(navigationController: navigationViewController)))
        }
        return navigationViewController
    }
    
    // MARK: - Private methods
    private func runChildFlow(openerType: OpenerType) {
        var closerType: CloserType
        switch openerType {
        case .root:
            closerType = .root
        case .modal:
            closerType = .modal(.init(animated: true))
        case .push(let config):
            closerType = .push(.init(navigationController: config.navigationController))
        }
        let coordinator = childFlowFactory.makeCoordinator(closerType: closerType)
        runNextFlow(coordinator: coordinator,
                    openType: openerType)
    }
}
