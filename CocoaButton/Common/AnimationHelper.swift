//
//  AnimationHelper.swift
//  CocoaButton
//
//  Created by Edgar Žigis on 17/10/2019.
//  Copyright © 2019 Edgar Žigis. All rights reserved.
//

import UIKit

class AnimationHelper {
    
    class func animateShadowOpacity(forLayer: CALayer, fromValue: Float, toValue: Float, duration: CFTimeInterval) {
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = duration
        forLayer.add(animation, forKey: animation.keyPath)
        forLayer.shadowOpacity = toValue
    }
}
