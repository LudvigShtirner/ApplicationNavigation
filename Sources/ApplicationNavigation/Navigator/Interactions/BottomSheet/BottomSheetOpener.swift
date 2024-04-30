//
//  BottomSheetOpener.swift
//
//
//  Created by Алексей Филиппов on 23.04.2024.
//

// SPM
import SupportCode
// Apple
import UIKit

final class BottomSheetOpener {
    // MARK: - Data
    /// Контроллер, с которого модально открывается новый контроллер
    private weak var presentingVC: UIViewController?
    private let cornerRadius: CGFloat
    private let detents: [UISheetPresentationController.Detent]
    private let prefersScrollingExpandsWhenScrolledToEdge: Bool
    private let prefersGrabberVisible: Bool
    
    // MARK: - Life cycle
    init(config: BottomSheetOpenConfig) {
        self.presentingVC = config.presentingController
        self.cornerRadius = config.cornerRadius
        self.detents = config.detents
        self.prefersScrollingExpandsWhenScrolledToEdge = config.prefersScrollingExpandsWhenScrolledToEdge
        self.prefersGrabberVisible = config.prefersGrabberVisible
    }
}

extension BottomSheetOpener: Opener {
    func show(_ viewController: UIViewController,
              completion: ResultBlock<Void>?) {
        guard let presentingVC else {
            completion?(.failure(ModalOpenError.noPresentingVC))
            return
        }
        guard presentingVC.presentedViewController == nil else {
            completion?(.failure(ModalOpenError.hasAlreadyPresentedVC))
            return
        }
        viewController.modalPresentationStyle = .pageSheet
        viewController.isModalInPresentation = true
        if let sheet = viewController.sheetPresentationController {
            sheet.preferredCornerRadius = cornerRadius
            sheet.detents = detents
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = prefersScrollingExpandsWhenScrolledToEdge
            sheet.prefersGrabberVisible = prefersGrabberVisible
        }
        presentingVC.present(viewController,
                             animated: true) {
            completion?(.success)
        }
    }
}
