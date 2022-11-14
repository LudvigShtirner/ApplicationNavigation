//
//  RootViewModelImpl.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

// Subprojects
import SupportCode

final class RootViewModelImpl {
    // MARK: - Dependencies
    
    // MARK: - Data
    private var closeAction: VoidBlock?
    private var pushAction: VoidBlock?
    private var modalAction: VoidBlock?
    private var fallAction: VoidBlock?
    
    // MARK: - Life cycle
    init() {
        
    }
    
    // MARK: - Private methods
    
}

// MARK: - RootViewModel
extension RootViewModelImpl: RootViewModel {
    var input: RootViewModelInput { return self }
    var output: RootViewModelOutput { return self }
    var coordinatorInteractor: RootCoordinatorInteractor { return self }
}

// MARK: - RootViewModelInput
extension RootViewModelImpl: RootViewModelInput {
    func moduleDidLoad() {
        
    }
    
    func modalButtonClicked() {
        modalAction?()
    }
    
    func pushButtonClicked() {
        pushAction?()
    }
    
    func fallButtonClicked() {
        fallAction?()
    }
}

// MARK: - RootViewModelOutput
extension RootViewModelImpl: RootViewModelOutput {
    
}

// MARK: - RootAlbumCellModelFactory
extension RootViewModelImpl: RootCoordinatorInteractor {
    func onClose(_ closure: @escaping VoidBlock) {
        closeAction = closure
    }
    
    func onPush(_ closure: @escaping VoidBlock) {
        pushAction = closure
    }
    
    func onModal(_ closure: @escaping VoidBlock) {
        modalAction = closure
    }
    
    func onFall(_ closure: @escaping VoidBlock) {
        fallAction = closure
    }
}
