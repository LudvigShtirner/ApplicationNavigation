//
//  RootViewModel.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

import SupportCode

protocol RootViewModel: AnyObject {
    var input: RootViewModelInput { get }
    var output: RootViewModelOutput { get }
    var coordinatorInteractor: RootCoordinatorInteractor { get }
}

protocol RootViewModelInput: AnyObject {
    func moduleDidLoad()
    func modalButtonClicked()
    func pushButtonClicked()
}

protocol RootViewModelOutput: AnyObject {
    
}

protocol RootCoordinatorInteractor: AnyObject {
    func onClose(_ closure: @escaping VoidBlock)
    func onPush(_ closure: @escaping VoidBlock)
    func onModal(_ closure: @escaping VoidBlock)
}
