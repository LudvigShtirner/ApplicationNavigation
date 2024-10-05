//
//  RootCoordinator.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

// Subprojects
import LSUserInterface
import ApplicationNavigation

// Apple
import UIKit

final class RootCoordinator: BaseCoordinator, IBaseCoordinator {
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
    
    // MARK: - IBaseCoordinator
    func createModule() -> UIViewController {
        let module = moduleFactory.buildModule()
        let navigationViewController = UINavigationController(rootViewController: module.viewController)
        navigationViewController.isNavigationBarHidden = true
        module.coordinatorInteractor.onClose { [weak self, weak navigationViewController] in
            guard let navigationViewController else { return }
            self?.finishFlow(viewController: navigationViewController)
        }
        module.coordinatorInteractor.onModal { [weak self, weak navigationViewController] in
            guard let navigationViewController else { return }
            self?.runChildFlow(openerType: .modal(.init(presentingController: navigationViewController)),
                               closerType: .modal(.init(animated: true)))
        }
        module.coordinatorInteractor.onPush { [weak self, weak navigationViewController] in
            guard let navigationViewController else { return }
            self?.runChildFlow(openerType: .push(.init(navigationController: navigationViewController)),
                               closerType: .push(.init(navigationController: navigationViewController)))
        }
        module.coordinatorInteractor.onFall { [weak self, weak navigationViewController] in
            guard let navigationViewController else { return }
            self?.runChildFlow(openerType: .fall(.init(presentingController: navigationViewController,
                                                       duration: 0.3)),
                               closerType: .fall(.init(duration: 0.3)))
        }
        module.coordinatorInteractor.onBottomSheet { [weak self, weak navigationViewController] in
            guard let navigationViewController else { return }
            self?.runChildFlow(openerType: .bottomSheet(.init(presentingController: navigationViewController,
                                                              cornerRadius: 24,
                                                              detents: [.medium(), .large()],
                                                              prefersScrollingExpandsWhenScrolledToEdge: true,
                                                              prefersGrabberVisible: true)),
                               closerType: .bottomSheet(.init(presentingController: navigationViewController)))
        }
        module.coordinatorInteractor.onCustomBottomSheet { [weak self, weak navigationViewController] in
            guard let navigationViewController else { return }
            let backgroundView = DesignedView().apply {
                $0.useBackgroundColor(.init(color: .black.withAlphaComponent(0.4)))
            }
            self?.runChildFlow(openerType: .customBottomSheet(.init(presentingViewController: navigationViewController,
                                                                    backgroundView: backgroundView)),
                               closerType: .customBottomSheet(.init()))
        }
        return navigationViewController
    }
    
    // MARK: - Private methods
    private func runChildFlow(openerType: OpenerType,
                              closerType: CloserType) {
        let coordinator = childFlowFactory.makeCoordinator(closeType: closerType)
        runNextFlow(coordinator: coordinator,
                    openType: openerType)
    }
}
