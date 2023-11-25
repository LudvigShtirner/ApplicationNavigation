//
//  ChildViewModel.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 10.11.2021.
//

// Subprojects
import SupportCode

protocol ChildViewModel: AnyObject {
    var input: ChildViewModelInput { get }
    var output: ChildViewModelOutput { get }
    var coordinatorInteractor: ChildCoordinatorInteractor { get }
}

protocol ChildViewModelInput: AnyObject {
    func moduleDidLoad()
    func closeButtonClicked()
}

protocol ChildViewModelOutput: AnyObject {
    
}

protocol ChildCoordinatorInteractor: AnyObject {
    func onClose(_ closure: @escaping VoidBlock)
}
