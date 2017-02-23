//
//  PushButtonView.swift
//  Flo
//
//  Created by Nando on 09/11/16.
//  Copyright © 2016 Nando. All rights reserved.
//

import UIKit

@IBDesignable
class PushButtonView: UIButton {
    
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        
        let plusHeight:CGFloat = 3.0
        let plusWidth:CGFloat = min(bounds.width, bounds.height) * 0.6
        
        let pathPlus = UIBezierPath()
        pathPlus.lineWidth = plusHeight
        
        pathPlus.move(to: CGPoint(x: bounds.width/2 - plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))
        pathPlus.addLine(to: CGPoint(x: bounds.width/2 + plusWidth/2 + 0.5, y: bounds.height/2 + 0.5))
        
        if isAddButton {
            pathPlus.move(to: CGPoint(x: bounds.width/2 + 0.5, y: bounds.height/2 - plusWidth/2 + 0.5))
            pathPlus.addLine(to: CGPoint(x: bounds.width/2 + 0.5, y: bounds.height/2 + plusWidth/2 + 0.5))
        }
        
        UIColor.white.setStroke()
        pathPlus.stroke()
        
        
        
        
    }
 

}
