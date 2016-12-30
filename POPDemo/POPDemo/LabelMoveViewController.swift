//
//  LabelMoveViewController.swift
//  POPDemo
//
//  Created by 孙超杰 on 29/12/2016.
//  Copyright © 2016 Chaojie Sun. All rights reserved.
//

import UIKit
import pop

class LabelMoveViewController: UIViewController {

    @IBOutlet weak var animationLabel: UILabel!
    
    @IBOutlet var tapGes: UITapGestureRecognizer!
    
    @IBOutlet weak var springSpeedSlide: UISlider!
    @IBOutlet weak var springBouncinessSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.ended {
            performAnimation()
        }
    }


    func performAnimation() {
        self.tapGes.isEnabled = false
        
        // 1. remove any existing animations
        let layer: CALayer = self.animationLabel.layer
        layer.pop_removeAllAnimations()
        
        // 2. configure pop animation
        let animation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        animation?.fromValue = 100
        animation?.toValue = 300
        
        animation?.springBounciness = CGFloat(springBouncinessSlider.value)
        animation?.springSpeed = CGFloat(springSpeedSlide.value)
        
        animation?.completionBlock = { popAnimation, finished in
            NSLog("Animation has completed.")
            self.tapGes.isEnabled = true
        }
        layer.pop_add(animation, forKey: kPOPLayerSize)
    }
    
    @IBAction func speedSliderValueChange(_ sender: UISlider) {
        let label = self.view.viewWithTag(20) as! UILabel
        label.text = "Spring Speed: \(springSpeedSlide.value)"
    }

    @IBAction func bouncinessValueChange(_ sender: UISlider) {
        
        let label = self.view.viewWithTag(30) as! UILabel
        label.text = "Spring Bounciness: \(springBouncinessSlider.value)"
    }
}
