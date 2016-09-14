//
//  FPSLabel.swift
//  FPSLabel
//
//  Created by Objective-C on 16/9/14.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

import UIKit
import Darwin

class FPSLabel: UILabel {

    private var displayLink: CADisplayLink?
    private var lastTime: TimeInterval = 0
    private var count: Int = 0
    
    deinit {
        displayLink?.invalidate()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        frame = CGRect.init(x: 15, y: UIScreen.main.bounds.height - 60, width: 70, height: 40)
        layer.cornerRadius = 20
        clipsToBounds = true
        backgroundColor = UIColor.black
        textAlignment = .center
        
        run()
    }
    
    func run() {
        displayLink = CADisplayLink.init(target: self, selector: #selector(self.tick(displayLink:)))
        displayLink?.add(to: RunLoop.current, forMode: .commonModes)
    }
    
    func tick(displayLink: CADisplayLink) {
        
        if lastTime == 0 {
            lastTime = displayLink.timestamp
            return
        }
        
        count += 1
        
        let timeDelta = displayLink.timestamp - lastTime
        
        if timeDelta < 1 {
            return
        }
        
        lastTime = displayLink.timestamp
        
        let fps: Double = Double(count) / timeDelta
        count = 0;
        let progress : Double = fps / 60.0
        let color = UIColor.init(hue: CGFloat(Double(0.27 * (progress - 0.2))), saturation: 1, brightness: 0.9, alpha: 1)
        let text : NSMutableAttributedString = NSMutableAttributedString.init(string: "\(round(fps)) FPS")
        text.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(text.length - 3, 3))
        text.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(text.length - 4, 1))
        text.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 14), range: NSMakeRange(0, text.length))
        attributedText = text
        textColor = color
        
    }
}
