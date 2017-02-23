//
//  CounterView.swift
//  Flo
//
//  Created by Nando on 09/11/16.
//  Copyright © 2016 Nando. All rights reserved.
//

import UIKit



@IBDesignable class CounterView: UIView {
    
    private static let NoOfGlasses = 8
    private let π:CGFloat = CGFloat(M_PI)
    
    
    @IBInspectable private(set) var counter:Int = 5 {
        
        didSet {
            if counter <=  CounterView.NoOfGlasses {
                //the view needs to be refreshed
                setNeedsDisplay()
            }
        }
        
    }
    @IBInspectable var outlineColor:UIColor = UIColor.blue
    @IBInspectable var counterColor:UIColor = UIColor.orange
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        //MARK: - draw counter
        
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius = max(bounds.width, bounds.height)
        let arcWidth = CGFloat(76)
        
        
        let startAngle = 3 * π/4
        let endAngle = π / 4
        
        
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.lineWidth = arcWidth
        
        counterColor.setStroke()
        path.stroke()
        
        
        
        //MARK: - draw outline
        let angleDifference = 2 * π - startAngle + endAngle
        
        
        let arcLengthPerGlass = angleDifference / CGFloat(CounterView.NoOfGlasses)
        
        
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter)  + startAngle
        
        
        
        let outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        
        outlinePath.addArc(withCenter: center, radius: bounds.width/2 - arcWidth + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        outlinePath.close()
        
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        
        
    }
    
    static postfix func ++ (counterView: CounterView) {
        if counterView.counter < CounterView.NoOfGlasses {
            counterView.counter += 1
        }
    }
    
    static postfix func -- (counterView: CounterView){
        if counterView.counter > 0 {
            counterView.counter -= 1
        }
    }
    

}
