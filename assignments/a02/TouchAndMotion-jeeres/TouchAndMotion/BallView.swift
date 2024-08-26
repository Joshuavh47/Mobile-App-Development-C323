//
//  BallView.swift
//  Ball
//
//  Created by Kim Topley.
//  Copyright (c) Apress. All rights reserved.
//

import UIKit
import CoreMotion

class BallView: UIView {
    fileprivate let image = UIImage(named : "ball")!
    fileprivate var currentPoint : CGPoint = CGPoint.zero
    var touchPoint : CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let myEvent = event{
            let firstTouch = myEvent.allTouches!.first
            let startingPoint = firstTouch?.location(in: self)
            if let myStartingPoint = startingPoint{
                touchPoint = myStartingPoint
            }
            print("x: \(startingPoint!.x) y: \(startingPoint!.y)")
            print("x: \(touchPoint!.x) y: \(touchPoint!.y)")
            
            currentPoint.x = touchPoint!.x
            currentPoint.y = touchPoint!.y
            
            self.setNeedsDisplay()
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() -> Void {
        currentPoint = CGPoint(x: (bounds.size.width / 2.0) +
                               (image.size.width / 2.0),
                               y: (bounds.size.height / 2.0) +
                               (image.size.height / 2.0))
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        if currentPoint == nil {
            image.draw(at: CGPoint(x: 0, y: 0))
        } else {
            image.draw(at: currentPoint)
            
        }
    }
}

