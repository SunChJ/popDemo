//
//  AliveButtonViewController.swift
//  POPDemo
//
//  Created by 孙超杰 on 29/12/2016.
//  Copyright © 2016 Chaojie Sun. All rights reserved.
//

import UIKit
import pop

class AliveButtonViewController: UIViewController {

    var buttonToggle = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bigButtonToggle(_ sender: UIButton) {
        
        buttonToggle = !buttonToggle
        
        let layer = sender.layer
        
        layer.pop_removeAllAnimations()
        
        let animation = POPSpringAnimation(propertyNamed: kPOPLayerSize)
        let rotation = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
        
        if buttonToggle {
            animation?.toValue = CGSize(width: 44, height: 44)
            rotation?.toValue = M_PI_4
            sender.tintColor = UIColor(displayP3Red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        } else {
            animation?.toValue = CGSize(width: 34, height: 34)
            rotation?.toValue = 0
            sender.tintColor = UIColor.red
        }
        
        animation?.springSpeed = 16
        animation?.springBounciness = 20
        
        animation?.completionBlock = { popAnimation, finished in
            NSLog("Animation has completed")
        }
        
        layer.pop_add(animation, forKey: kPOPLayerSize)
        layer.pop_add(rotation, forKey: kPOPLayerRotation)
    }

}
