//
//  RectanglesView.swift
//  Rectangles
//
//  Created by Joshua Eres on 3/27/24.
//

import UIKit

class RectanglesView: UIView {
    
    var myDrawingColor: UIColor = UIColor.brown {
        didSet{
            self.setNeedsDisplay()
        }
    }
    var touchPoint: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let myEvent = event{
            let firstTouch = myEvent.allTouches!.first
            let startingPoint = firstTouch?.location(in: self)
            touchPoint = startingPoint
            print("x: \(startingPoint!.x) y: \(startingPoint!.y)")
            print("x: \(touchPoint!.x) y: \(touchPoint!.y)")
            
        }
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        let myFirstPath = UIBezierPath()
        myFirstPath.lineWidth = 4
        
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
            var tempCalc: Double = (theMinOfTheTwoSides - myFirstPath.lineWidth)/2.0-(CGFloat(i)*theMinOfTheTwoSides*CGFloat(0.12))
            if(touchPoint?.x == nil || touchPoint?.y == nil){
                myFirstPath.move(to: CGPoint(x:circleCenter.x+tempCalc, y:drawingBounds.origin.y + drawingBounds.size.height/2.0))
                myFirstPath.addArc(withCenter: circleCenter, radius: tempCalc, startAngle: CGFloat(0.0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
                
                
            }
            else{
                myFirstPath.move(to: CGPoint(x:touchPoint!.x+tempCalc, y:touchPoint!.y))
                myFirstPath.addArc(withCenter: touchPoint!, radius: tempCalc, startAngle: CGFloat(0.0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
                
                
                
            }
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
