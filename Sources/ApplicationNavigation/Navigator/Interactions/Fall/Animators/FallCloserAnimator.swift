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
        let fromVCFrame = transitionContext.finalFrame(for: fromVC)
        let toVC = transitionContext.viewController(forKey: .to)!
        
        transitionContext.containerView.insertSubview(toVC.view, at: 0)
        
        let animator = UIViewPropertyAnimator(duration: duration,
                                              timingParameters: kFallAnimationTimingFunction)
        animator.scrubsLinearly = false
        animator.addAnimations {
            fromVC.view.frame = .init(origin: .init(x: .zero,
                                                    y: -fromVCFrame.size.height),
                                      size: fromVCFrame.size)
        }
        animator.addCompletion { position in
            let success = position == .end
            guard success else {
                transitionContext.completeTransition(false)
                return
            }
            let isCancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!isCancelled)
        }
        animator.startAnimation()
    }
}
