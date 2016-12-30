//
//  PPCustomSegue.swift
//  POPDemo
//
//  Created by 孙超杰 on 30/12/2016.
//  Copyright © 2016 Chaojie Sun. All rights reserved.
//

import UIKit
import pop

class PPCustomSegue: UIStoryboardSegue {
    override func perform() {
        let sourcViewController = self.source
        let destinationController = self.destination
        
        let layer = destinationController.view.layer
        layer.pop_removeAllAnimations()
        
        print("Layer frame X: \(layer.frame.origin.x)")
        print("Layer frame width: \(layer.frame.size.width)")
        
        let xAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
        let sizeAnimation = POPSpringAnimation(propertyNamed: kPOPLayerSize)
        
        xAnimation?.fromValue = 320
        xAnimation?.springBounciness = 16
        xAnimation?.springSpeed = 10
        
        sizeAnimation?.fromValue = CGSize(width: 64, height: 114)
        xAnimation?.completionBlock = { _ in
            print("Animation has completed")
            print("Layer frame X: \(layer.frame.origin.x)")
        }
        
        layer.pop_add(xAnimation, forKey: "position")
        layer.pop_add(sizeAnimation, forKey: "size")
        
        sourcViewController.navigationController?.pushViewController(destinationController, animated: false)
    }
}
