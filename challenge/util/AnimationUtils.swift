//
//  AnimationUtils.swift
//  challenge
//
//  Created by Toju on 3/1/21.
//

import UIKit

extension UIView {
    
    func animateX(delay: TimeInterval, duration: TimeInterval, distance: CGFloat) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut) {
            self.transform = CGAffineTransform(translationX: distance, y: 0)
        }
        

    }
    
    
    func animateY(delay: TimeInterval, duration: TimeInterval, distance: CGFloat) {
//        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseOut) {
//            self.transform = CGAffineTransform(translationX: 0, y: distance)
//        }
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut) {
            self.transform = CGAffineTransform(translationX: 0, y: distance)
        }
    }
    
    
    func animateAlphaX(delay: TimeInterval, duration: TimeInterval, distance: CGFloat) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut) {
            self.alpha = 0
            self.transform = CGAffineTransform(translationX: 0, y: distance)
        }
    }
    
    func animateAlphaY(delay: TimeInterval, duration: TimeInterval, distance: CGFloat) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut) {
            self.alpha = 0
            self.transform = CGAffineTransform(translationX: 0, y: distance)
        }
    }
    
    
    func animateSizeUp(delay: TimeInterval, duration: TimeInterval, width: CGFloat, height: CGFloat) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut) {
            self.transform = CGAffineTransform(scaleX: width, y: height)
        }
    }
    
    
}
