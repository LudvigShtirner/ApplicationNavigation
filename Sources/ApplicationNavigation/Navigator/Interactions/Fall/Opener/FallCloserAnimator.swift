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
        let toVC = transitionContext.viewController(forKey: .to)!
        let containerView = transitionContext.containerView
        
        let fallingView = toVC.view!
        containerView.addSubview(fallingView)
        
        let size = fallingView.frame.size
        fallingView.frame = .init(origin: .zero,
                                  size: size)
        
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
