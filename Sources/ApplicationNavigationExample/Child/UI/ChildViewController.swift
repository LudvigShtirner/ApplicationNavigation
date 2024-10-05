//
//  ChildViewController.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 10.11.2021.
//

// SPM
import LSUserInterface
import SnapKit
// Apple
import UIKit

/// Контроллер отображения модуля дочернего экрана демонстрации переходов
final class ChildViewController: BaseViewController {
    // MARK: - Dependencies
    private let viewModel: ChildViewModelInput
    
    // MARK: - UI
    private let cancelButton = DesignedButton().apply {
        $0.setTitle(RootLocalization.cancel, for: .normal)
    }
    private let backgroundImageView = DesignedImageView().apply {
        let resource = UIImage(resource: .wallpaper)
        $0.useImage(resource)
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    // MARK: - Inits
    init(input: ChildViewModelInput,
         output: ChildViewModelOutput) {
        self.viewModel = input
        super.init(nibName: nil, bundle: nil)
        
        bindToViewModel(output)
    }
    
    // MARK: - Overrides methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.moduleDidLoad()
    }
    
    // MARK: - Private methods
    private func bindToViewModel(_ output: ChildViewModelOutput) {
        
    }
    
    // MARK: - BaseViewController
    override func setupUI() {
        view.clipsToBounds = true
        view.addSubview(backgroundImageView)
        view.addSubview(cancelButton)
        cancelButton.onEvent(.touchUpInside) { [weak self] in
            self?.viewModel.closeButtonClicked()
        }
    }
    
    override func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        cancelButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
}

// MARK: - SwiftUI Preview
import SwiftUI

struct ChildViewControllerContainer_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVCPreview {
            ChildModuleFactoryBase().buildModule().viewController
        }
            .previewLayout(.device)
            .edgesIgnoringSafeArea(.vertical)
    }
}
