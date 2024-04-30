//
//  BottomSheetCloser.swift
//  
//
//  Created by Алексей Филиппов on 23.04.2024.
//

// SPM
import SupportCode
// Apple
import UIKit

final class BottomSheetCloser {
    // MARK: - Data
    /// Контроллер, с которого модально открывается новый контроллер
    private weak var presentingVC: UIViewController?
    
    // MARK: - Life cycle
    init(config: BottomSheetCloseConfig) {
        self.presentingVC = config.presentingController
    }
}

extension BottomSheetCloser: Closer {
    func hide(_ viewController: UIViewController,
              completion: VoidBlock?) {
        viewController.dismiss(animated: true)
    }
}
