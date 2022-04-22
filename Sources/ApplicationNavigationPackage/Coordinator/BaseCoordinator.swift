//
//  BaseCoordinator.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 27.12.2020.
//

// Subprojects
import SupportCodePackage

// Apple
import UIKit

/// Базовый класс координатора
open class BaseCoordinator {
    // MARK: - Dependencies
    /// Фабрика навигаторов
    private let navigatorFactory: NavigatorFactory
    
    // MARK: - Data
    /// Массив дочерних кординаторов
    private var childCoordinators: [BaseCoordinator] = []
    /// Блок операций 
    private var completionHandler: VoidBlock?
    
    // MARK: - Life cycle
    /// Конструктор базового класса
    public init() {
        navigatorFactory = NavigatorFactoryImpl.shared
    }
    
    // MARK: - Must been overrided method
    /// Создать модуль
    /// - Returns: Контроллер модуля
    open func createModule() -> UIViewController {
        fatalError("Must been implemented in \(Self.self)")
    }
    
    // MARK: - Used by childs
    /// Запустить координатор следующего модуля
    /// - Parameters:
    ///   - coordinator: координатор нового модуля
    ///   - openType: тип открытия нового модуля
    ///   - flowCompletion: блок действий при уничтожении координатора
    public func runNextFlow(coordinator: BaseCoordinator,
                            openType: OpenerType,
                            flowCompletion: VoidBlock? = nil) {
        addDependency(coordinator)
        coordinator.completionHandler = { [weak self, weak coordinator] in
            flowCompletion?()
            self?.removeDependency(coordinator)
        }
        let viewController = coordinator.createModule()
        let navigator = navigatorFactory.makeOpener(type: openType)
        navigator.show(viewController,
                       completion: nil)
    }
    
    /// Завершить работу модуля
    /// - Parameters:
    ///   - viewController: закрывающийся контроллер
    ///   - closeType: тип закрытия нового модуля
    ///   - completion: блок действий при скрытии контроллера
    public func finishFlow(viewController: UIViewController,
                           closeType: CloserType,
                           completion: VoidBlock? = nil) {
        let navigator = navigatorFactory.makeCloser(type: closeType)
        navigator.hide(viewController,
                       completion: { [weak self] in
                        completion?()
                        self?.completionHandler?()
                       })
    }
    
    // MARK: - Private methods
    /// Добавить координатор как дочерний
    /// - Parameter coordinator: координатор
    private func addDependency(_ coordinator: BaseCoordinator) {
        if childCoordinators.contains(where: { $0 === coordinator }) {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    /// Удалить дочерний координатор
    /// - Parameter coordinator: координатор
    private func removeDependency(_ coordinator: BaseCoordinator?) {
        guard childCoordinators.isEmpty == false,
              let coordinator = coordinator else {
            return
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
        }
    }
}
