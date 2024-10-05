//
//  RootFlowFactory.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

protocol RootFlowFactory {
    func makeCoordinator() -> RootCoordinator
}

final class RootFlowFactoryBase: RootFlowFactory {
    // MARK: - RootFlowFactory
    func makeCoordinator() -> RootCoordinator {
        let moduleFactory = RootModuleFactoryBase()
        let childFlowFactory = ChildFlowFactoryBase()
        return RootCoordinator(moduleFactory: moduleFactory,
                               childFlowFactory: childFlowFactory)
    }
}
