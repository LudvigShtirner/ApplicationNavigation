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
    
    // MARK: - Inits
    init(moduleFactory: RootModuleFactory,
         childFlowFactory: ChildFlowFactory) {
        self.moduleFactory = moduleFactory
        self.childFlowFactory = childFlowFactory
        super.init(closeType: .root)
    }
    
    // MARK: - BaseCoordinator
    override func createModule() -> UIViewController {
        let module = moduleFactory.buildModule()
        let navigationViewController = UINavigationController(rootViewController: module.viewController)
        navigationViewController.isNavigationBarHidden = true
        module.coordinatorInteractor.onClose { [weak self, weak navigationViewController] in
            guard let navigationViewController = navigationViewController else { return }
            self?.finishFlow(viewController: navigationViewController)
        }
        module.coordinatorInteractor.onModal { [weak self, weak navigationViewController] in
            guard let navigationViewController = navigationViewController else { return }
            self?.runChildFlow(openerType: .modal(.init(presentingController: navigationViewController)),
                               navigationViewController: navigationViewController)
        }
        module.coordinatorInteractor.onPush { [weak self, weak navigationViewController] in
            guard let navigationViewController = navigationViewController else { return }
            self?.runChildFlow(openerType: .push(.init(navigationController: navigationViewController)),
                               navigationViewController: navigationViewController)
        }
        module.coordinatorInteractor.onFall { [weak self, weak navigationViewController] in
            guard let navigationViewController = navigationViewController else { return }
            self?.runChildFlow(openerType: .fall(.init(presentingController: navigationViewController,
                                                       duration: 0.3)),
                               navigationViewController: navigationViewController)
        }
        return navigationViewController
    }
    
    // MARK: - Private methods
    private func runChildFlow(openerType: OpenerType,
                              navigationViewController: UINavigationController) {
        var closeType: CloserType
        switch openerType {
        case .root:
            closeType = .root
        case .modal:
            closeType = .modal(.init(animated: true))
        case .push:
            closeType = .push(.init(navigationController: navigationViewController))
        case .fall(_):
            closeType = .fall(.init(duration: 0.3))
        case .tab(_):
            return
        }
        let coordinator = childFlowFactory.makeCoordinator(closeType: closeType)
        runNextFlow(coordinator: coordinator,
                    openType: openerType)
    }
}
