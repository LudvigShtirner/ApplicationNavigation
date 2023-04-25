//
//  FallOpenerAnimator.swift
//  
//
//  Created by Алексей Филиппов on 14.11.2022.
//

// Apple
import UIKit

// MARK: - Constants
let kFallAnimationTimingFunction = UICubicTimingParameters(controlPoint1: .zero,
                                                           controlPoint2: CGPoint(x: 0.3, y: 1.0))

/// Кастомный аниматор открытия ViewController
final class FallOpenerAnimator: NSObject {
    // MARK: - Data
    /// Длительность анимации
    private let duration: TimeInterval
    
    // MARK: - Inits
    /// Конструктор аниматора
    /// - Parameter duration: Длительность анимации
    init(duration: TimeInterval) {
        self.duration = duration
        super.init()
    }
}

// MARK: - UIViewControllerAnimatedTransitioning
extension FallOpenerAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: .to)!
        let finalFrame = transitionContext.finalFrame(for: toVC)
        let containerView = transitionContext.containerView
        let fallingView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(fallingView)
        
        fallingView.frame = .init(origin: .init(x: .zero,
                                                y: -finalFrame.size.height),
                                  size: finalFrame.size)
        
        let animator = UIViewPropertyAnimator(duration: duration,
                                              timingParameters: kFallAnimationTimingFunction)
        animator.scrubsLinearly = false
        animator.addAnimations {
            fallingView.frame = finalFrame
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
