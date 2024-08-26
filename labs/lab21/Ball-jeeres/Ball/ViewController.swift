//
//  ViewController.swift
//  Ball
//
//  Created by Kim Topley.
//  Copyright (c) Apress. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    fileprivate let updateInterval = 1.0/60.0
    fileprivate let motionManager = CMMotionManager()
    fileprivate let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.deviceMotionUpdateInterval = updateInterval
        motionManager.startDeviceMotionUpdates(to: queue, withHandler: {
                (motionData , error) -> Void in
            let ballView = self.view as! BallView
            ballView.acceleration = motionData!.gravity
            DispatchQueue.main.async(execute: {
                ballView.update()
            })
        })
    }
}

