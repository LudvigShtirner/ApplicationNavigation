//
//  RootFlowFactory.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

protocol RootFlowFactory {
    func makeCoordinator() -> RootCoordinator
}

final class RootFlowFactoryImpl: RootFlowFactory {
    // MARK: - RootFlowFactory
    func makeCoordinator() -> RootCoordinator {
        let moduleFactory = RootModuleFactoryImpl()
        let childFlowFactory = ChildFlowFactoryImpl()
        return RootCoordinator(moduleFactory: moduleFactory,
                               childFlowFactory: childFlowFactory)
    }
}
