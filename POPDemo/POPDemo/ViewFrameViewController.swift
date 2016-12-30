//
//  ViewFrameViewController.swift
//  POPDemo
//
//  Created by 孙超杰 on 29/12/2016.
//  Copyright © 2016 Chaojie Sun. All rights reserved.
//

import UIKit
import pop

class ViewFrameViewController: UIViewController {

    @IBOutlet weak var heightConstraints: NSLayoutConstraint!
    @IBOutlet weak var widthConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var isInFullScreen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func rightItemClickAction(_ sender: UIButton) {
        performFullScreenAnimation()
        isInFullScreen = !isInFullScreen
    }
    func performFullScreenAnimation() {
        let baseRect = CGRect(x: 69, y: view.center.y - 118/2, width: 182, height: 118)
        let fullRect = CGRect(x: 0, y: view.center.y - 208/2, width: 320, height: 208)
        
        imageView.pop_removeAllAnimations()
        
        let animation = POPSpringAnimation(propertyNamed: kPOPViewFrame)
        animation?.springBounciness = 8
        
        if !isInFullScreen {
            animation?.toValue = fullRect
        } else {
            animation?.toValue = baseRect
        }
        
        imageView.pop_add(animation, forKey: "fullscreen")
    }
}
