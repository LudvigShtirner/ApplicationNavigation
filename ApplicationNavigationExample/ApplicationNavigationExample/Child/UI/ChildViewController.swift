//
//  ChildViewController.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 10.11.2021.
//

// Apple
import UIKit

// Pods
import SnapKit

/// Контроллер отображения модуля дочернего экрана демонстрации переходов
final class ChildViewController: UIViewController {
    // MARK: - Dependencies
    private let viewModel: ChildViewModelInput
    
    // MARK: - UI
    private let cancelButton = UIButton(type: .system)
    private let backgroundImageView = UIImageView()
    
    // MARK: - Life Cycle
    init(input: ChildViewModelInput,
         output: ChildViewModelOutput) {
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
    private func bindToViewModel(_ output: ChildViewModelOutput) {
        
    }
    
    private func setupUI() {
        view.addSubview(backgroundImageView)
        backgroundImageView.image = UIImage(named: "wallpaper")
        backgroundImageView.contentMode = .scaleAspectFill
        
        view.addSubview(cancelButton)
        cancelButton.setTitle(RootLocalization.cancel, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        
        setupColors()
        setupConstraints()
    }
    
    private func setupColors() {
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        cancelButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    // MARK: - Actions
    @objc private func cancelButtonClicked() {
        viewModel.closeButtonClicked()
    }
}

// MARK: - SwiftUI Preview
#if canImport(SwiftUI)
import SwiftUI

struct ChildViewControllerContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ChildViewController {
        return ChildModuleFactoryImpl().buildModule().viewController
    }
    
    func updateUIViewController(_ uiView: ChildViewController,
                                context: Context) {}
}

struct ChildViewControllerContainer_Previews: PreviewProvider {
    static var previews: some View {
        ChildViewControllerContainer()
            .previewLayout(.device)
            .edgesIgnoringSafeArea(.vertical)
    }
}

#endif
