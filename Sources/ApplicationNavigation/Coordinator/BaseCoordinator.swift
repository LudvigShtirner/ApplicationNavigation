//
//  BaseCoordinator.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 27.12.2020.
//

// SPM
import SupportCode
// Apple
import UIKit

/// Базовый класс координатора
open class BaseCoordinator: NSObject {
    // MARK: - Dependencies
    /// Фабрика навигаторов
    let navigatorFactory: NavigatorFactory
    
    // MARK: - Data
    /// Массив дочерних кординаторов
    private var childCoordinators: [BaseCoordinator] = []
    /// Параметр скрытия
    private let closeType: CloserType
    /// Блок операций
    var completionHandler: VoidBlock?
    
    // MARK: - Inits
    /// Конструктор базового класса
    public init(closeType: CloserType) {
        navigatorFactory = NavigatorFactoryBase.shared
        self.closeType = closeType
        super.init()
    }
    
    // MARK: - Used by childs
    /// Завершить работу модуля
    /// - Parameters:
    ///   - viewController: закрывающийся контроллер
    ///   - closeType: тип закрытия нового модуля
    ///   - completion: блок действий при скрытии контроллера
    public func finishFlow(viewController: UIViewController,
                           completion: VoidBlock? = nil) {
        guard viewController.view.window != nil else {
            completion?()
            completionHandler?()
            return
        }
        let closer = navigatorFactory.makeCloser(type: closeType)
        closer.hide(viewController) { [weak self] in
            completion?()
            self?.completionHandler?()
        }
    }
    
    // MARK: - Internal methods
    /// Добавить координатор как дочерний
    /// - Parameter coordinator: координатор
    func addDependency(_ coordinator: BaseCoordinator) {
        if childCoordinators.contains(where: { $0 === coordinator }) {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    /// Удалить дочерний координатор
    /// - Parameter coordinator: координатор
    func removeDependency(_ coordinator: BaseCoordinator?) {
        guard childCoordinators.isEmpty == false,
              let coordinator else {
            return
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
        }
    }
}
