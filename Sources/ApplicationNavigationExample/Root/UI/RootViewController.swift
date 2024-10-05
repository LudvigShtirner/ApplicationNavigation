//
//  RootViewController.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

// SPM
import LSUserInterface
import SupportCode

// Apple
import UIKit

// Pods
import SnapKit

/// Контроллер отображения модуля основного экрана демонстрации переходов
final class RootViewController: BaseViewController {
    // MARK: - Dependencies
    private let viewModel: RootViewModelInput
    
    // MARK: - UI
    private let stackView = UIStackView()
    private let cancelButton = DesignedButton(type: .system).apply {
        $0.setTitle(RootLocalization.cancel, for: .normal)
    }
    private lazy var modalOpeningButton = DesignedButton(type: .system)
        .apply {
            $0.setTitle(RootLocalization.modal, for: .normal)
            $0.useTitleColor(.init(normal: .init(lightColor: .black, darkColor: .white)))
        }
        .onEvent(.touchUpInside) { [unowned viewModel] in
            viewModel.modalButtonClicked()
        }
    private lazy var pushOpeningButton = DesignedButton(type: .system)
        .apply {
            $0.setTitle(RootLocalization.push, for: .normal)
            $0.useTitleColor(.init(normal: .init(lightColor: .black, darkColor: .white)))
        }
        .onEvent(.touchUpInside) { [unowned viewModel] in
            viewModel.pushButtonClicked()
        }
    private lazy var fallOpeningButton = DesignedButton(type: .system)
        .apply {
            $0.setTitle(RootLocalization.fall, for: .normal)
            $0.useTitleColor(.init(normal: .init(lightColor: .black, darkColor: .white)))
        }
        .onEvent(.touchUpInside) { [unowned viewModel] in
            viewModel.fallButtonClicked()
        }
    private lazy var bottomSheetButton = DesignedButton(type: .system)
        .apply {
            $0.setTitle(RootLocalization.bottomSheet, for: .normal)
            $0.useTitleColor(.init(normal: .init(lightColor: .black, darkColor: .white)))
        }
        .onEvent(.touchUpInside) { [unowned viewModel] in
            viewModel.bottomSheetClicked()
        }
    private lazy var customBottomSheetButton = DesignedButton(type: .system)
        .apply {
            $0.setTitle(RootLocalization.customBottomSheet, for: .normal)
            $0.useTitleColor(.init(normal: .init(lightColor: .black, darkColor: .white)))
        }
        .onEvent(.touchUpInside) { [weak self] in
            self?.viewModel.customBottomSheetClicked()
        }
    
    // MARK: - Inits
    init(input: RootViewModelInput,
         output: RootViewModelOutput) {
        self.viewModel = input
        super.init()
    }
    
    // MARK: - Private methods
    override func setupUI() {
        view.addSubview(stackView)
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        
        stackView.addArrangedSubview(modalOpeningButton)
        stackView.addArrangedSubview(pushOpeningButton)
        stackView.addArrangedSubview(fallOpeningButton)
        stackView.addArrangedSubview(bottomSheetButton)
        stackView.addArrangedSubview(customBottomSheetButton)
        
        view.addSubview(cancelButton)
    }
    
    override func setupColors() {
        view.backgroundColor = view.isDarkMode ? .black : .white
        stackView.backgroundColor = .clear
    }
    
    override func setupConstraints() {
        cancelButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(16.0)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16.0)
        }
        stackView.snp.makeConstraints { make in
            make.left.right.centerY.equalToSuperview()
        }
    }
}

// MARK: - SwiftUI Preview
import SwiftUI

struct RootViewControllerContainer_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVCPreview {
            RootModuleFactoryBase().buildModule().viewController
        }
            .previewLayout(.device)
            .edgesIgnoringSafeArea(.vertical)
    }
}
