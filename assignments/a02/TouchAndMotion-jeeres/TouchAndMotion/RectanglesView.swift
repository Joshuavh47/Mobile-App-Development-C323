//
//  RectanglesView.swift
//  Rectangles
//
//  Created by Joshua Eres on 3/27/24.
//

import UIKit
import CoreMotion

class RectanglesView: UIView {
    let LINEWIDTH: CGFloat = CGFloat(4.0)
    var myDrawingColor: UIColor = UIColor.brown {
        didSet{
            self.setNeedsDisplay()
        }
    }
    var acceleration = CMAcceleration(x: 0, y: 0, z: 0)
    fileprivate var currentPoint : CGPoint = CGPoint.zero {
        didSet {
            let theMinOfTheTwoSides: CGFloat
            if(self.bounds.size.width > self.bounds.size.height){
                theMinOfTheTwoSides = self.bounds.size.height
            }
            else{
                theMinOfTheTwoSides = self.bounds.size.width
            }
            var newX = currentPoint.x
            var newY = currentPoint.y
            if newX < 0 {
                newX = bounds.size.width - (theMinOfTheTwoSides - LINEWIDTH)/2.0
                
            } else if newX > bounds.size.width - (theMinOfTheTwoSides - LINEWIDTH)/2.0 {
                newX = 0
                
            }
            if newY < 0 {
                newY = bounds.size.height - (theMinOfTheTwoSides - LINEWIDTH)/2.0
                
            } else if newY > bounds.size.height - (theMinOfTheTwoSides - LINEWIDTH)/2.0 {
                newY = 0
                
            }
            currentPoint = CGPoint(x: newX, y: newY)
            
            let currentRect = CGRect(x: newX, y: newY,
                width: newX + (theMinOfTheTwoSides - LINEWIDTH)/2.0,
                height: newY + (theMinOfTheTwoSides - LINEWIDTH)/2.0)
            let prevRect = CGRect(x: oldValue.x, y: oldValue.y,
                width: oldValue.x + (theMinOfTheTwoSides - LINEWIDTH)/2.0,
                height: oldValue.y + (theMinOfTheTwoSides - LINEWIDTH)/2.0)
            setNeedsDisplay(currentRect.union(prevRect))
        }
    }
    fileprivate var ballXVelocity = 0.0
    fileprivate var ballYVelocity = 0.0
    fileprivate var lastUpdateTime = Date()
    
    var velocity_multiplier: Double = 250
    
    func update() -> Void {
        
        let now = Date()
        let secondsSinceLastDraw = now.timeIntervalSince(lastUpdateTime)
        ballXVelocity = ballXVelocity + (acceleration.x * secondsSinceLastDraw)
        ballYVelocity = ballYVelocity - (acceleration.y * secondsSinceLastDraw)
        
        
        
        let xDelta = secondsSinceLastDraw * ballXVelocity * velocity_multiplier
        let yDelta = secondsSinceLastDraw * ballYVelocity * velocity_multiplier
        currentPoint = CGPoint(x: currentPoint.x + CGFloat(xDelta), y: currentPoint.y + CGFloat(yDelta))
        lastUpdateTime = now
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
        let theMinOfTheTwoSides: CGFloat
        if(self.bounds.size.width > self.bounds.size.height){
            theMinOfTheTwoSides = self.bounds.size.height
        }
        else{
            theMinOfTheTwoSides = self.bounds.size.width
        }
        currentPoint = CGPoint(x: (bounds.size.width / 2.0) +
                                   ((theMinOfTheTwoSides - LINEWIDTH)/2.0 / 2.0),
                                   y: (bounds.size.height / 2.0) +
                                   ((theMinOfTheTwoSides - LINEWIDTH)/2.0 / 2.0))
    }

//    override func draw(_ rect: CGRect) {
//        // Drawing code
//        image.draw(at: currentPoint)
//    }
    
    
    override func draw(_ rect: CGRect) {
        print("x: \(acceleration.x) y: \(acceleration.y)")
        let myFirstPath = UIBezierPath()
        myFirstPath.lineWidth = LINEWIDTH
        
        let drawingBounds = self.bounds
        var circleCenter = CGPoint()
        circleCenter.x = drawingBounds.origin.x + drawingBounds.size.width/2.0
        circleCenter.y = drawingBounds.origin.y + drawingBounds.size.height/2.0
        let theMinOfTheTwoSides: CGFloat
        if(drawingBounds.size.width > drawingBounds.size.height){
            theMinOfTheTwoSides = drawingBounds.size.height
        }
        else{
            theMinOfTheTwoSides = drawingBounds.size.width
        }
        
        self.myDrawingColor.setStroke()
        
        
        
        
        for i in 0...3{
            var tempCalc: Double = (theMinOfTheTwoSides - myFirstPath.lineWidth*2)/2.0-(CGFloat(i)*theMinOfTheTwoSides*CGFloat(0.12))
            myFirstPath.move(to: CGPoint(x:currentPoint.x+tempCalc, y:currentPoint.y))
            myFirstPath.addArc(withCenter: currentPoint, radius: tempCalc, startAngle: CGFloat(0.0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        }
        
        myFirstPath.stroke()
        
//        myFirstPath.stroke()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
