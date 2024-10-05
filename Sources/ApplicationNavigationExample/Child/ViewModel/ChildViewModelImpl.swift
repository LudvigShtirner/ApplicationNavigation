//
//  ChildViewModelBase.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 10.11.2021.
//

// Subprojects
import SupportCode

final class ChildViewModelBase {
    // MARK: - Dependencies
    
    // MARK: - Data
    private var closeAction: VoidBlock?
    
    // MARK: - Inits
    init() {
        
    }
    
    // MARK: - Private methods
    
}

// MARK: - ChildViewModel
extension ChildViewModelBase: ChildViewModel {
    var input: ChildViewModelInput { self }
    var output: ChildViewModelOutput { self }
    var coordinatorInteractor: ChildCoordinatorInteractor { self }
}

// MARK: - ChildViewModelInput
extension ChildViewModelBase: ChildViewModelInput {
    func moduleDidLoad() {
        
    }
    
    func closeButtonClicked() {
        closeAction?()
    }
}

// MARK: - ChildViewModelOutput
extension ChildViewModelBase: ChildViewModelOutput {
    
}

// MARK: - ChildAlbumCellModelFactory
extension ChildViewModelBase: ChildCoordinatorInteractor {
    func onClose(_ closure: @escaping VoidBlock) {
        closeAction = closure
    }
}
