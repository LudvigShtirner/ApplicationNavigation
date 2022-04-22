//
//  RootViewController.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

// Apple
import UIKit

// Pods
import SnapKit

/// Контроллер отображения модуля основного экрана демонстрации переходов
final class RootViewController: UIViewController {
    // MARK: - Dependencies
    private let viewModel: RootViewModelInput
    
    // MARK: - UI
    private let stackView = UIStackView()
    private let cancelButton = UIButton(type: .system)
    private let modalOpeningButton = UIButton(type: .system)
    private let pushOpeningButton = UIButton(type: .system)
    
    // MARK: - Life Cycle
    init(input: RootViewModelInput,
         output: RootViewModelOutput) {
        self.viewModel = input
        super.init(nibName: nil, bundle: nil)
        
        bindToViewModel(output)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.moduleDidLoad()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColors()
    }
    
    // MARK: - Private methods
    private func bindToViewModel(_ output: RootViewModelOutput) {
        
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        
        stackView.addArrangedSubview(modalOpeningButton)
        modalOpeningButton.setTitle(RootLocalization.modal, for: .normal)
        modalOpeningButton.addTarget(self, action: #selector(modalButtonClicked), for: .touchUpInside)
        
        stackView.addArrangedSubview(pushOpeningButton)
        pushOpeningButton.setTitle(RootLocalization.push, for: .normal)
        pushOpeningButton.addTarget(self, action: #selector(pushButtonClicked), for: .touchUpInside)
        
        view.addSubview(cancelButton)
        cancelButton.setTitle(RootLocalization.cancel, for: .normal)
        
        setupColors()
        setupConstraints()
    }
    
    private func setupColors() {
        view.backgroundColor = view.isDarkMode ? .black : .white
        stackView.backgroundColor = .clear
        modalOpeningButton.setTitleColor(view.isDarkMode ? .white : .black,
                                         for: .normal)
        pushOpeningButton.setTitleColor(view.isDarkMode ? .white : .black,
                                        for: .normal)
    }
    
    private func setupConstraints() {
        cancelButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        stackView.snp.makeConstraints { make in
            make.left.right.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    @objc private func modalButtonClicked() {
        viewModel.modalButtonClicked()
    }
    
    @objc private func pushButtonClicked() {
        viewModel.pushButtonClicked()
    }
}

// MARK: - SwiftUI Preview
#if canImport(SwiftUI)
import SwiftUI

struct RootViewControllerContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> RootViewController {
        return RootModuleFactoryImpl().buildModule().viewController
    }
    
    func updateUIViewController(_ uiView: RootViewController,
                                context: Context) {}
}

struct RootViewControllerContainer_Previews: PreviewProvider {
    static var previews: some View {
        RootViewControllerContainer()
            .colorScheme(.light)
            .previewLayout(.device)
        RootViewControllerContainer()
            .colorScheme(.dark)
            .previewLayout(.device)
    }
}

#endif
