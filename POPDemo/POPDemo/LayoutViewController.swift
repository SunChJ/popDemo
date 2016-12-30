//
//  LayoutViewController.swift
//  POPDemo
//
//  Created by 孙超杰 on 29/12/2016.
//  Copyright © 2016 Chaojie Sun. All rights reserved.
//

import UIKit
import pop

class LayoutViewController: UIViewController {
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var isInFullScreen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func rightItemClickAction(_ sender: UIButton) {
        performFullScreenAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func performFullScreenAnimation() {
        
        
        
        widthConstraint.pop_removeAllAnimations()
        heightConstraint.pop_removeAllAnimations()
        
        let heightAnimation = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        heightAnimation?.springBounciness = 8
        
        let animation = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        animation?.springBounciness = 8
        
        if !isInFullScreen {
            animation?.toValue = 320.0
            heightAnimation?.toValue = 208.0
        } else {
            animation?.toValue = 182.0
            heightAnimation?.toValue = 118.0
        }
        
        isInFullScreen = !isInFullScreen
        
        heightConstraint.pop_add(heightAnimation, forKey: "fullScreen")
        widthConstraint.pop_add(animation, forKey: "fullscreen")
    }
}
