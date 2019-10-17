//
//  Pose.swift
//  CocoaButton
//
//  Created by Edgar Žigis on 17/10/2019.
//  Copyright © 2019 Edgar Žigis. All rights reserved.
//

import UIKit

struct Pose {
    
    let secondsSincePriorPose: CFTimeInterval
    let start: CGFloat
    let length: CGFloat
    
    init(_ secondsSincePriorPose: CFTimeInterval, _ start: CGFloat, _ length: CGFloat) {
        self.secondsSincePriorPose = secondsSincePriorPose
        self.start = start
        self.length = length
    }
}
