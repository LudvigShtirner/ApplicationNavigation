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
    private let cancelButton = BaseButton(type: .system)
    private let modalOpeningButton = BaseButton(type: .system)
    private let pushOpeningButton = BaseButton(type: .system)
    private let fallOpeningButton = BaseButton(type: .system)
    
    // MARK: - Inits
    init(input: RootViewModelInput,
         output: RootViewModelOutput) {
        self.viewModel = input
        super.init(nibName: nil, bundle: nil)
        
        bindToViewModel(output)
    }
    
    // MARK: - Overrides methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.moduleDidLoad()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColors()
    }
    
    // MARK: - Private methods
    private func bindToViewModel(_ output: RootViewModelOutput) {
        
    }
    
    override func setupUI() {
        view.addSubview(stackView)
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        
        stackView.addArrangedSubview(modalOpeningButton)
        modalOpeningButton.setTitle(RootLocalization.modal, for: .normal)
        modalOpeningButton.onEvent(.touchUpInside) { [weak self] in
            self?.viewModel.modalButtonClicked()
        }
        
        stackView.addArrangedSubview(pushOpeningButton)
        pushOpeningButton.setTitle(RootLocalization.push, for: .normal)
        pushOpeningButton.onEvent(.touchUpInside) { [weak self] in
            self?.viewModel.pushButtonClicked()
        }

        
        stackView.addArrangedSubview(fallOpeningButton)
        fallOpeningButton.setTitle(RootLocalization.fall, for: .normal)
        fallOpeningButton.onEvent(.touchUpInside) { [weak self] in
            self?.viewModel.fallButtonClicked()
        }

        
        view.addSubview(cancelButton)
        cancelButton.setTitle(RootLocalization.cancel, for: .normal)
        
        setupColors()
        setupConstraints()
    }
    
    override func setupColors() {
        view.backgroundColor = view.isDarkMode ? .black : .white
        stackView.backgroundColor = .clear
        modalOpeningButton.setTitleColor(view.isDarkMode ? .white : .black,
                                         for: .normal)
        pushOpeningButton.setTitleColor(view.isDarkMode ? .white : .black,
                                        for: .normal)
        fallOpeningButton.setTitleColor(view.isDarkMode ? .white : .black,
                                        for: .normal)
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
            RootModuleFactoryImpl().buildModule().viewController
        }
            .previewLayout(.device)
            .edgesIgnoringSafeArea(.vertical)
    }
}
