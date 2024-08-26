//
//  BallViewController.swift
//  TouchAndMotion
//
//  Created by Camille Fraizer on 3/31/24.
//

import Foundation
import UIKit

class BallViewController: UIViewController {
    var touchPoint: CGPoint?
    @IBOutlet weak var myView: UIView?
    var currentPoint: CGPoint?
    let image = UIImage(named : "ball")!
    var myBallView: UIView = BallView()
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let myEvent = event{
            let firstTouch = myEvent.allTouches!.first
            let startingPoint = firstTouch?.location(in: myView)
            touchPoint = startingPoint
            print("x: \(startingPoint!.x) y: \(startingPoint!.y)")
            print("x: \(touchPoint!.x) y: \(touchPoint!.y)")
            
            currentPoint?.x = touchPoint!.x
            currentPoint?.y = touchPoint!.y
            
            
        }
    }
    
    func draw(_ rect: CGRect) {
        // Drawing code
        if currentPoint == nil {
            image.draw(at: CGPoint(x: 0, y: 0))
        } else {
            if let myCurrentPoint = currentPoint{
                image.draw(at: myCurrentPoint)
            }
        }
    }
    
    override func viewDidLoad() {
        self.view.addSubview(myBallView)
    }
    
}
