//
//  NavigatorFactory.swift
//  ApplicationNavigation
//
//  Created by Алексей Филиппов on 13.02.2021.
//

// Apple
import UIKit

/// Фабрика для создания навигаторов
public protocol NavigatorFactory: AnyObject {
    /// Создать навигатор выбранного типа для открытия контроллера
    /// - Parameter type: тип навигатора
    func makeOpener(type: OpenerType) -> Opener
    
    /// Создать навигатор указанного типа для скрытия контроллера
    /// - Parameter type: тип навигатора
    func makeCloser(type: CloserType) -> Closer
}

/// Реализация фабрики навигаторов
public final class NavigatorFactoryBase: NavigatorFactory {
    // MARK: - Inits
    /// Синглтон фабрики для уменьшения потребления памяти
    public static let shared = NavigatorFactoryBase()
    /// Приватный конструктор для избегания создания дополнительных инстансов
    private init() { }
    
    // MARK: - NavigatorFactory
    public func makeCloser(type: CloserType) -> Closer {
        switch type {
        case .root:
            return RootCloser()
        case .push(let config):
            return NavigationCloser(navigationController: config.navigationController,
                                    animated: config.animated)
        case .modal(let config):
            return ModalCloser(animated: config.animated)
        case .fall(let config):
            return FallCloser(duration: config.duration)
        case .tab(let config):
            return TabCloser(config: config)
        case .bottomSheet(let config):
            return BottomSheetCloser(config: config)
        case .customBottomSheet(let config):
            return CustomBottomSheetCloser(config: config)
        }
    }
    
    public func makeOpener(type: OpenerType) -> Opener {
        switch type {
        case .root(let window):
            return RootOpener(window: window)
        case .push(let config):
            return NavigationOpener(navigationController: config.navigationController,
                                    animated: config.animated,
                                    replaceStack: config.replaceStack)
        case .modal(let config):
            return ModalOpener(presentingVC: config.presentingController,
                               animated: config.animated,
                               modalPresentationStyle: config.modalPresentationStyle,
                               modalTransitionStyle: config.modalTransitionStyle)
        case .fall(let config):
            return FallOpener(presentingVC: config.presentingController,
                              duration: config.duration)
        case .tab(let config):
            return TabOpener(config: config)
        case .bottomSheet(let config):
            return BottomSheetOpener(config: config)
        case .customBottomSheet(let config):
            return CustomBottomSheetOpener(config: config)
        }
    }
}
