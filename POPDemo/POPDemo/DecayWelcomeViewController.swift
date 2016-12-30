//
//  DecayWelcomeViewController.swift
//  POPDemo
//
//  Created by 孙超杰 on 30/12/2016.
//  Copyright © 2016 Chaojie Sun. All rights reserved.
//

import UIKit
import pop

class DecayWelcomeViewController: UIViewController {

    @IBOutlet var tapGes: UITapGestureRecognizer!
    
    @IBOutlet weak var velocitySlider: UISlider!
    @IBOutlet weak var decelerationSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapClickAction(_ sender: UITapGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.ended {
            performAnimation()
        }
    }
    
    func performAnimation() {
        tapGes.isEnabled = false
        decelerationSlider.isEnabled = false
        velocitySlider.isEnabled = false
        
        let layer = view.viewWithTag(10) as! UILabel
        layer.pop_removeAllAnimations()
        
        let animation = POPDecayAnimation(propertyNamed: kPOPLayerPositionY)
        animation?.fromValue = 150
        animation?.velocity = CGFloat(velocitySlider.value)
        animation?.deceleration = CGFloat(decelerationSlider.value)
        animation?.completionBlock = { _ in
            print("Aniamtion has completed.")
            self.tapGes.isEnabled = true
            self.decelerationSlider.isEnabled = true
            self.velocitySlider.isEnabled = true
        }
        layer.pop_add(animation, forKey: "size")
    }

    @IBAction func velocitySliderValueChange(_ sender: UISlider) {
        let label = view.viewWithTag(20) as! UILabel
        label.text = "Velocity: \(sender.value)"
        resetLabel()
    }

    @IBAction func decelerationSliderValueChange(_ sender: UISlider) {
        let label = view.viewWithTag(30) as! UILabel
        label.text = "Deceleration: \(sender.value)"
        resetLabel()
    }
    
    func resetLabel() {
        let layer = view.viewWithTag(10)
        layer?.frame = CGRect(x: 20, y: 150, width: 280, height: 42)
    }
    
    

}
