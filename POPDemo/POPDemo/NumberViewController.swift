//
//  NumberViewController.swift
//  POPDemo
//
//  Created by 孙超杰 on 29/12/2016.
//  Copyright © 2016 Chaojie Sun. All rights reserved.
//

import UIKit
import pop

class NumberViewController: UIViewController {

    var numberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberButton = UIButton(frame: CGRect(x: 20, y: 220, width: 80, height: 30))
        numberButton.setTitle("999", for: UIControlState.normal)
        numberButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        numberButton.backgroundColor = UIColor.gray
        view.addSubview(numberButton)
        
        numberButton.addTarget(self, action: #selector(buttonClipAction(sender:)), for: .touchUpInside)
    }
    
    func buttonClipAction(sender: UIButton) {
        
        numberButton.isEnabled = false
    
        
        let layer = numberButton.layer
        layer.pop_removeAllAnimations()
        
        let moveAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        moveAnimation?.fromValue = numberButton.frame.height
        moveAnimation?.toValue = 0
        moveAnimation?.springSpeed = 16
        moveAnimation?.springBounciness = 20

        moveAnimation?.completionBlock = { _ in
            self.numberButton.isEnabled = true
            self.numberButton.frame = CGRect(x: 20, y: 220, width: 80, height: 30)
        }
        layer.pop_add(moveAnimation, forKey: kPOPLayerSize)
    }

    

}
