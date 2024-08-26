//
//  ViewController.swift
//  TouchAndMotion
//
//  Created by Camille Fraizer on 3/30/24.
//

import UIKit
import CoreMotion

class MotionViewController: UIViewController {
    
    fileprivate let updateInterval = 1.0/60.0
    fileprivate let motionManager = CMMotionManager()
    fileprivate let queue = OperationQueue()
    
    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var color = UIColor.red
    
    
    func setup(){
        var doubleSizedFrame = self.view.bounds
        doubleSizedFrame.size.width = self.view.bounds.size.width * 2
        var size = CGSize(width: myScrollView.bounds.size.width*2, height: myScrollView.bounds.size.height)
        myScrollView.contentSize = size
        myScrollView.contentOffset = CGPoint(x:0, y:0)
        let ourFirstRectangle = CGRect(x:0, y:0, width:myScrollView.bounds.size.width, height: myScrollView.bounds.size.height)
        var rectView = RectanglesView(frame: ourFirstRectangle)
        rectView.backgroundColor = UIColor.red
        myScrollView.addSubview(rectView)
        let ourSecondRect = CGRect(x:myScrollView.bounds.size.width, y:0, width:myScrollView.bounds.size.width, height: myScrollView.bounds.size.height)
        var rectView2 = RectanglesView(frame: ourSecondRect)
        rectView2.backgroundColor = UIColor.blue
        myScrollView.addSubview(rectView2)
        motionManager.deviceMotionUpdateInterval = updateInterval
        motionManager.startDeviceMotionUpdates(to: queue, withHandler: {
                (motionData , error) -> Void in
            rectView.acceleration = motionData!.gravity
            rectView2.acceleration = motionData!.gravity
            DispatchQueue.main.async(execute: {
                rectView.update()
                rectView2.update()
                rectView.setNeedsDisplay()
                rectView2.setNeedsDisplay()
            })
            
        })
    }
    
    
    
    override func viewDidLoad() {
        
        myScrollView.backgroundColor = UIColor.green
        setup()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
}

