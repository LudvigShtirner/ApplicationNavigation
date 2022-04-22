//
//  ChildViewModelImpl.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 10.11.2021.
//

// Subprojects
import SupportCode

final class ChildViewModelImpl {
    // MARK: - Dependencies
    
    // MARK: - Data
    private var closeAction: VoidBlock?
    
    // MARK: - Life cycle
    init() {
        
    }
    
    // MARK: - Private methods
    
}

// MARK: - ChildViewModel
extension ChildViewModelImpl: ChildViewModel {
    var input: ChildViewModelInput { self }
    var output: ChildViewModelOutput { self }
    var coordinatorInteractor: ChildCoordinatorInteractor { self }
}

// MARK: - ChildViewModelInput
extension ChildViewModelImpl: ChildViewModelInput {
    func moduleDidLoad() {
        
    }
    
    func closeButtonClicked() {
        closeAction?()
    }
}

// MARK: - ChildViewModelOutput
extension ChildViewModelImpl: ChildViewModelOutput {
    
}

// MARK: - ChildAlbumCellModelFactory
extension ChildViewModelImpl: ChildCoordinatorInteractor {
    func onClose(_ closure: @escaping VoidBlock) {
        closeAction = closure
    }
}
