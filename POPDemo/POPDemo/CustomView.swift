//
//  CustomView.swift
//  POPDemo
//
//  Created by 孙超杰 on 29/12/2016.
//  Copyright © 2016 Chaojie Sun. All rights reserved.
//

import UIKit

class CustomView: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "CustomViewXib", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
