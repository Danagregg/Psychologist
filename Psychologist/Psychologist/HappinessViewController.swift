//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Dana Gregg on 11/15/15.
//  Copyright © 2015 Dana Gregg. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    var happiness: Int = 10 { // 0 = very sad, 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            updateUI()
        }
    }
    
    private struct Constants{
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0{
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }

    private func updateUI(){
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }

}
