//
//  BottomSheetConfigs.swift
//
//
//  Created by Алексей Филиппов on 26.04.2024.
//

// Apple
import UIKit

public struct BottomSheetOpenConfig {
    // MARK: - Data
    let presentingController: UIViewController
    let cornerRadius: CGFloat
    let detents: [UISheetPresentationController.Detent]
    let prefersScrollingExpandsWhenScrolledToEdge: Bool
    let prefersGrabberVisible: Bool
    
    // MARK: - Life cycle
    public init(presentingController: UIViewController,
                cornerRadius: CGFloat,
                detents: [UISheetPresentationController.Detent],
                prefersScrollingExpandsWhenScrolledToEdge: Bool,
                prefersGrabberVisible: Bool) {
        self.presentingController = presentingController
        self.cornerRadius = cornerRadius
        self.detents = detents
        self.prefersScrollingExpandsWhenScrolledToEdge = prefersScrollingExpandsWhenScrolledToEdge
        self.prefersGrabberVisible = prefersGrabberVisible
    }
}

public struct BottomSheetCloseConfig {
    // MARK: - Data
    let presentingController: UIViewController
    
    // MARK: - Life cycle
    public init(presentingController: UIViewController) {
        self.presentingController = presentingController
    }
}
