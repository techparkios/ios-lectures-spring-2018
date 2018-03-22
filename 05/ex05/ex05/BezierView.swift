//
//  BezierView.swift
//  ex05
//
//  Created by Gennady Evstratov on 3/21/18.
//  Copyright © 2018 TechPark. All rights reserved.
//

import UIKit

class BezierView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: CGRect(x: 10, y: 10, width: 50, height: 50), cornerRadius: 10)
        UIColor.green.setFill()
        path.fill()
    }

}
