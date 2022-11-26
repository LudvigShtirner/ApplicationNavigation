//
//  FallCloserAnimator.swift
//  
//
//  Created by Алексей Филиппов on 14.11.2022.
//

// Apple
import UIKit

/// Кастомный аниматор скрытия контроллера отображения
final class FallCloserAnimator: NSObject {
    // MARK: - Data
    /// Длительность анимации
    private let duration: TimeInterval
    
    // MARK: - Life Cycle
    /// Конструктор аниматора
    /// - Parameter duration: Длительность анимации
    init(duration: TimeInterval) {
        self.duration = duration
        super.init()
    }
}

// MARK: - UIViewControllerAnimatedTransitioning
extension FallCloserAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        let fallingView = fromVC.view!
        let size = fallingView.frame.size
        toVC.view.frame.origin = .zero
        
        UIView.animate(withDuration: duration,
                       delay: .zero,
                       options: [.allowAnimatedContent, .curveEaseInOut, .preferredFramesPerSecond60]) {
            fallingView.frame = .init(origin: .init(x: .zero,
                                                    y: -size.height),
                                      size: size)
        } completion: { success in
            let isCancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!isCancelled)
        }
    }
}
