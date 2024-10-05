//
//  RootViewModelBase.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

// Subprojects
import SupportCode

final class RootViewModelBase {
    // MARK: - Dependencies
    
    // MARK: - Data
    private var closeAction: VoidBlock?
    private var pushAction: VoidBlock?
    private var modalAction: VoidBlock?
    private var fallAction: VoidBlock?
    private var bottomSheetAction: VoidBlock?
    private var customBottomSheetAction: VoidBlock?
    
    // MARK: - Inits
    init() {
        
    }
    
    // MARK: - Private methods
    
}

// MARK: - RootViewModel
extension RootViewModelBase: RootViewModel {
    var input: RootViewModelInput { return self }
    var output: RootViewModelOutput { return self }
    var coordinatorInteractor: RootCoordinatorInteractor { return self }
}

// MARK: - RootViewModelInput
extension RootViewModelBase: RootViewModelInput {
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
    
    func bottomSheetClicked() {
        bottomSheetAction?()
    }
    
    func customBottomSheetClicked() {
        customBottomSheetAction?()
    }
}

// MARK: - RootViewModelOutput
extension RootViewModelBase: RootViewModelOutput {
    
}

// MARK: - RootAlbumCellModelFactory
extension RootViewModelBase: RootCoordinatorInteractor {
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
    
    func onBottomSheet(_ closure: @escaping VoidBlock) {
        bottomSheetAction = closure
    }
    
    func onCustomBottomSheet(_ closure: @escaping VoidBlock) {
        customBottomSheetAction = closure
    }
}
