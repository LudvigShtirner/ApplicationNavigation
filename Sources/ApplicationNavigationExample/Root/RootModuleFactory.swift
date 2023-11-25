//
//  RootModuleFactory.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

protocol RootModuleFactory {
    func buildModule() -> (viewController: RootViewController,
                           coordinatorInteractor: RootCoordinatorInteractor)
}

final class RootModuleFactoryImpl: RootModuleFactory {
    // MARK: - RootModuleFactory
    func buildModule() -> (viewController: RootViewController,
                           coordinatorInteractor: RootCoordinatorInteractor) {
        let viewModel = buildViewModel()
        let viewController = RootViewController(input: viewModel.input,
                                                output: viewModel.output)
        return (viewController, viewModel.coordinatorInteractor)
    }
    
    // MARK: - Private methods
    private func buildViewModel() -> RootViewModel {
        return RootViewModelImpl()
    }
}
