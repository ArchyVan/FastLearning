//
//  CAGradientLayerController.swift
//  LearnCAGradientLayer
//
//  Created by Objective-C on 16/9/19.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

import UIKit

enum PanDirections: Int {
    case Right
    case Left
    case Bottom
    case Top
    case TopLeftToBottomRight
    case TopRightToBottomLeft
    case BottomLeftToTopRight
    case BottomRightToTopLeft
}

class CAGradientLayerController: UIViewController, CAAnimationDelegate{

    var gradientLayer : CAGradientLayer!
    var colorSets = [[CGColor]]()
    var currentColorSet : Int!
    var panDirection : PanDirections!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createColorSets()
        let singleTap = UITapGestureRecognizer.init(target: self, action: #selector(self.handleTapGesture(_:)))
        let twoTap = UITapGestureRecognizer.init(target: self, action: #selector(self.handleTwoTapGesture(_:)))
        twoTap.numberOfTouchesRequired = 2
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(self.handlePanGesture(_:)))
        self.view.addGestureRecognizer(pan)
        self.view.addGestureRecognizer(singleTap)
        self.view.addGestureRecognizer(twoTap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
    }
    // MARK: UI
    func createGradientLayer()  {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 1.0)
        gradientLayer.colors = colorSets[currentColorSet]
        gradientLayer.locations = [0.0,0.35]
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func createColorSets()  {
        colorSets.append([UIColor.red.cgColor,UIColor.yellow.cgColor])
        colorSets.append([UIColor.green.cgColor,UIColor.magenta.cgColor])
        colorSets.append([UIColor.gray.cgColor,UIColor.lightGray.cgColor])
        
        currentColorSet = 0
    }
    // MARK: Private
    func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        if currentColorSet < colorSets.count - 1 {
            currentColorSet! += 1
        } else {
            currentColorSet = 0
        }
        
        let colorChangeAnimation = CABasicAnimation.init(keyPath: "colors")
        colorChangeAnimation.delegate = self
        colorChangeAnimation.duration = 2
        colorChangeAnimation.toValue = colorSets[currentColorSet]
        colorChangeAnimation.fillMode = kCAFillModeForwards
        colorChangeAnimation.isRemovedOnCompletion = false
        gradientLayer.add(colorChangeAnimation, forKey: "colorChange")
        
    }
    
    func handleTwoTapGesture(_ gestureRecognizer: UITapGestureRecognizer)  {
        let secondColorLocation = arc4random_uniform(100)
        let firstColorLocation = arc4random_uniform(secondColorLocation - 1)
        gradientLayer.locations = [NSNumber.init(value: Double(firstColorLocation)/100.0),NSNumber.init(value: Double(secondColorLocation)/100.0)]
        print(gradientLayer.locations!)
    }
    
    func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer)  {
        let velocity = gestureRecognizer.velocity(in: self.view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.changed {
            if velocity.x > 300.0 {
                // 水平向右的情况
                // 之后检测竖直方向上的速度
                
                if velocity.y > 300.0 {
                    // 从左上到右下
                    panDirection = PanDirections.TopLeftToBottomRight
                }
                else if velocity.y < -300.0 {
                    // 从左下到右上
                    panDirection = PanDirections.BottomLeftToTopRight
                }
                else {
                    // 水平向右
                    panDirection = PanDirections.Right
                }
            }
            else if velocity.x < -300.0 {
                // 水平方向想左的情况
                // 之后检测数值方向上的速度
                
                if velocity.y > 300.0 {
                    // 从右上到左下
                    panDirection = PanDirections.TopRightToBottomLeft
                }
                else if velocity.y < -300.0 {
                    // 从右下到左上
                    panDirection = PanDirections.BottomRightToTopLeft
                }
                else {
                    // 水平向左
                    panDirection = PanDirections.Left
                }
            }
            else {
                // 只有竖直方向上的状态（向上或向下）
                
                if velocity.y > 300.0 {
                    // 竖直向下
                    panDirection = PanDirections.Bottom
                }
                else if velocity.y < -300.0 {
                    // 竖直向上
                    panDirection = PanDirections.Top
                }
                else {
                    // 无手势
                    panDirection = nil
                }
            }
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.ended {
            changeGradientDirection()
        }
    }
    
    func changeGradientDirection() {
        if panDirection != nil {
            switch panDirection.rawValue {
            case PanDirections.Right.rawValue:
                gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
                gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
                
            case PanDirections.Left.rawValue:
                gradientLayer.startPoint = CGPoint.init(x: 1.0, y: 0.5)
                gradientLayer.endPoint = CGPoint.init(x: 0.0, y:0.5)
                
            case PanDirections.Bottom.rawValue:
                gradientLayer.startPoint = CGPoint.init(x:0.5,y: 0.0)
                gradientLayer.endPoint = CGPoint.init(x:0.5,y: 1.0)
                
            case PanDirections.Top.rawValue:
                gradientLayer.startPoint = CGPoint.init(x:0.5, y:1.0)
                gradientLayer.endPoint = CGPoint.init(x:0.5,y: 0.0)
                
            case PanDirections.TopLeftToBottomRight.rawValue:
                gradientLayer.startPoint = CGPoint.init(x:0.0, y:0.0)
                gradientLayer.endPoint = CGPoint.init(x:1.0,y: 1.0)
                
            case PanDirections.TopRightToBottomLeft.rawValue:
                gradientLayer.startPoint = CGPoint.init(x:1.0, y:0.0)
                gradientLayer.endPoint = CGPoint.init(x:0.0,y: 1.0)
                
            case PanDirections.BottomLeftToTopRight.rawValue:
                gradientLayer.startPoint = CGPoint.init(x:0.0, y:1.0)
                gradientLayer.endPoint = CGPoint.init(x:1.0, y:0.0)
                
            default:
                gradientLayer.startPoint = CGPoint.init(x:1.0,y: 1.0)
                gradientLayer.endPoint = CGPoint.init(x:0.0,y: 0.0)
            }
        }
    }
    // MARK:CAAnimationDelegate
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradientLayer.colors = colorSets[currentColorSet]
        }
    }

}

