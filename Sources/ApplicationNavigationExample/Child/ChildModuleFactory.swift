//
//  ChildModuleFactory.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 10.11.2021.
//

protocol ChildModuleFactory {
    func buildModule() -> (viewController: ChildViewController,
                           coordinatorInteractor: ChildCoordinatorInteractor)
}

final class ChildModuleFactoryBase: ChildModuleFactory {
    // MARK: - Dependencies
    
    // MARK: - ChildModuleFactory
    func buildModule() -> (viewController: ChildViewController,
                           coordinatorInteractor: ChildCoordinatorInteractor) {
        let viewModel = buildViewModel()
        let viewController = ChildViewController(input: viewModel.input,
                                                 output: viewModel.output)
        return (viewController, viewModel.coordinatorInteractor)
    }
    
    // MARK: - Private methods
    private func buildViewModel() -> ChildViewModel {
        return ChildViewModelBase()
    }
}
