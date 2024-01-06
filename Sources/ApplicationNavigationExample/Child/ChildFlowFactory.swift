//
//  ChildFlowFactory.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 10.11.2021.
//

// Subprojects
import ApplicationNavigation

protocol ChildFlowFactory {
    func makeCoordinator(closeType: CloserType) -> ChildCoordinator
}

final class ChildFlowFactoryImpl: ChildFlowFactory {
    // MARK: - ChildFlowFactory
    func makeCoordinator(closeType: CloserType) -> ChildCoordinator {
        let moduleFactory = ChildModuleFactoryImpl()
        return ChildCoordinator(moduleFactory: moduleFactory,
                                closeType: closeType)
    }
}
