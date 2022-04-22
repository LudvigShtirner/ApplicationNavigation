//
//  ChildFlowFactory.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 10.11.2021.
//

// Subprojects
import ApplicationNavigationPackage

protocol ChildFlowFactory {
    func makeCoordinator(closerType: CloserType) -> ChildCoordinator
}

final class ChildFlowFactoryImpl: ChildFlowFactory {
    // MARK: - ChildFlowFactory
    func makeCoordinator(closerType: CloserType) -> ChildCoordinator {
        let moduleFactory = ChildModuleFactoryImpl()
        return ChildCoordinator(moduleFactory: moduleFactory,
                                closerType: closerType)
    }
}
