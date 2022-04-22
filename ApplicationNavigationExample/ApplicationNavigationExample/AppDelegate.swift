//
//  AppDelegate.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 22.04.2022.
//

// Subprojects
import ApplicationNavigation

// Apple
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private let flowFactory: RootFlowFactory = RootFlowFactoryImpl()
    private var appCoordinator = BaseCoordinator()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if window == nil {
            window = UIWindow()
        }
        let coordinator = flowFactory.makeCoordinator()
        appCoordinator.runNextFlow(coordinator: coordinator,
                                   openType: .root(window!))
        return true
    }
}
