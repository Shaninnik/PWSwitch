//
//  PWSwitch.swift
//  Pods
//
//  Created by Nikita on 30/08/16.
//
//

import Foundation
import UIKit

public class PWSwitch: UIControl {
    
    var backLayer: CALayer!
    var thumbLayer: CALayer!
    
    var on = false
    
    /// UIAppearance compatible property
    dynamic var trackOffBorderColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._trackOffBorderColor }
        set {
            self._trackOffBorderColor = newValue
            self.backLayer.borderColor = _trackOffBorderColor?.CGColor
        }
    }
    private var _trackOffBorderColor: UIColor?
    
    dynamic var trackOffPushBorederColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._trackOffPushBorederColor }
        set {
            self._trackOffPushBorederColor = newValue
        }
    }
    private var _trackOffPushBorederColor: UIColor?
    
    dynamic var trackOffPushFillColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._trackOffPushFillColor }
        set {
            self._trackOffPushFillColor = newValue
        }
    }
    private var _trackOffPushFillColor: UIColor?
    
    dynamic var trackOffFillColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._trackOffFillColor }
        set {
            self._trackOffFillColor = newValue
            self.backLayer.backgroundColor = _trackOffFillColor?.CGColor
        }
    }
    private var _trackOffFillColor: UIColor?
    
    dynamic var trackOnFillColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._trackOnFillColor }
        set {
            self._trackOnFillColor = newValue
        }
    }
    private var _trackOnFillColor: UIColor?
    
    
    dynamic var thumbOffBorderColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbOffBorderColor }
        set {
            self._thumbOffBorderColor = newValue
            self.thumbLayer.borderColor = _thumbOffBorderColor?.CGColor
        }
    }
    private var _thumbOffBorderColor: UIColor?
    
    
    dynamic var thumbOnBorderColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbOnBorderColor }
        set {
            self._thumbOnBorderColor = newValue
        }
    }
    private var _thumbOnBorderColor: UIColor?
    
    
    dynamic var thumbOffFillColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbOffFillColor }
        set {
            self._thumbOffFillColor = newValue
            self.thumbLayer.backgroundColor = _thumbOffFillColor?.CGColor
        }
    }
    private var _thumbOffFillColor: UIColor?
    
    dynamic var thumbOnFillColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbOnFillColor }
        set {
            self._thumbOnFillColor = newValue
        }
    }
    private var _thumbOnFillColor: UIColor?
    
    dynamic var thumbShadowColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbShadowColor }
        set {
            self._thumbShadowColor = newValue
            
            self.thumbLayer.shadowColor = _thumbShadowColor?.CGColor
        }
    }
    private var _thumbShadowColor: UIColor?
    
    dynamic var thumbDiameter: CGFloat { // UI_APPEARANCE_SELECTOR
        get { return self._thumbDiameter }
        set {
            self._thumbDiameter = newValue
            
            self.thumbLayer.frame = getThumbOffRect()
            self.thumbLayer.cornerRadius = thumbDiameter / 2
        }
    }
    private var _thumbDiameter: CGFloat
    
    dynamic var cornerRadius: CGFloat { // UI_APPEARANCE_SELECTOR
        get { return self._cornerRadius }
        set {
            self._cornerRadius = newValue
            
            self.backLayer.cornerRadius = _cornerRadius
        }
    }
    private var _cornerRadius: CGFloat
    
    dynamic var thumbCornerRadius: CGFloat { // UI_APPEARANCE_SELECTOR
        get { return self._thumbCornerRadius }
        set {
            self._thumbCornerRadius = newValue
            
            self.thumbLayer.cornerRadius = _thumbCornerRadius
        }
    }
    private var _thumbCornerRadius: CGFloat
    
    dynamic var shouldFillOnPush: Bool { // UI_APPEARANCE_SELECTOR
        get { return self._shouldFillOnPush }
        set {
            self._shouldFillOnPush = newValue
        }
    }
    private var _shouldFillOnPush: Bool
    
    //var thumbOnBorderColor = UIColor.colorWithRGB(0xF0AA26).CGColor
    
    let thumbDelta:CGFloat = 6
    
    let scale = UIScreen.mainScreen().scale
    
    override public init(frame: CGRect) {
        self._thumbDiameter = 14
        self._cornerRadius = 13
        self._thumbCornerRadius = 7
        self._shouldFillOnPush = true
        
        super.init(frame: frame)
        
        baseInit()
    }
    
    required public init(coder aDecoder: NSCoder) {
        self._thumbDiameter = 14
        self._cornerRadius = 13
        self._thumbCornerRadius = 7
        self._shouldFillOnPush = true
        
        super.init(coder: aDecoder)!
        
        baseInit()
    }
    
    public init() {
        self._thumbDiameter = 14
        self._cornerRadius = 13
        self._thumbCornerRadius = 7
        self._shouldFillOnPush = true
        
        super.init(frame: CGRectZero)
        
        baseInit()
    }
    
    private func baseInit() {
        
        //init default style
        self._trackOffBorderColor = UIColorFromRGB(0xB1BBC3)
        self.trackOffPushBorederColor = UIColorFromRGB(0xE0E4E9)
        self._trackOffFillColor = UIColor.clearColor()
        self._trackOnFillColor = UIColorFromRGB(0xFFB831)
        self._thumbOffBorderColor = UIColorFromRGB(0xB1BBC3)
        self._thumbOnBorderColor = UIColorFromRGB(0xF0AA26)
        self._thumbOffFillColor = UIColorFromRGB(0xFFFFFF)
        self._thumbOnFillColor = UIColorFromRGB(0xFFFFFF)
        self._thumbShadowColor = UIColorFromRGB(0x919CA6)
        
        backLayer = CALayer()
        backLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 26)
        backLayer.cornerRadius = _cornerRadius
        backLayer.borderWidth = 1
        backLayer.borderColor = _trackOffBorderColor?.CGColor
        backLayer.backgroundColor = _trackOffFillColor?.CGColor
        layer.addSublayer(backLayer)
        
        thumbLayer = CALayer()
        thumbLayer.frame = getThumbOffRect()
        thumbLayer.cornerRadius = _thumbCornerRadius
        thumbLayer.backgroundColor = _thumbOffFillColor?.CGColor
        thumbLayer.borderWidth = 1
        thumbLayer.shadowOffset = CGSize(width: 0, height: 1.5)
        thumbLayer.shadowRadius = 0.6
        thumbLayer.shadowColor = _thumbShadowColor?.CGColor
        thumbLayer.shadowOpacity = 0.26
        thumbLayer.borderColor = _thumbOffBorderColor?.CGColor
        
        layer.addSublayer(thumbLayer)
    }
    
    override public func intrinsicContentSize() -> CGSize {
        return CGSize(width: 50, height: 26)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        backLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        if (on) {
            thumbLayer.frame = getThumbOnRect()
            
            if (shouldFillOnPush) {
                backLayer.borderWidth = frame.height / 2
            }
            
        } else {
            thumbLayer.frame = getThumbOffRect()
        }
    }
    
    private func getThumbOffRect() -> CGRect {
        return CGRect(x: (frame.height - thumbDiameter)/2.0, y: (frame.height - thumbDiameter)/2.0, width: thumbDiameter, height: thumbDiameter)
    }
    
    private func getThumbOffPushRect() -> CGRect {
        return CGRect(x: (frame.height - thumbDiameter)/2.0, y: (frame.height - thumbDiameter)/2.0, width: thumbDiameter + thumbDelta, height: thumbDiameter)
    }
    
    private func getThumbOnRect() -> CGRect {
        return CGRect(x: frame.width - thumbDiameter - ((frame.height - thumbDiameter)/2.0), y: (frame.height - thumbDiameter)/2.0, width: thumbDiameter, height: thumbDiameter)
    }
    
    private func getThumbOffPos() -> CGPoint {
        return CGPoint(x: frame.height/2.0, y: frame.height/2.0)
    }
    
    private func getThumbOffPushPos() -> CGPoint {
        return CGPoint(x: frame.height/2.0 + thumbDelta - 3, y: frame.height/2.0)
    }
    
    private func getThumbOnPos() -> CGPoint {
        return CGPoint(x: frame.width - frame.height/2.0, y: frame.height/2.0)
    }
    
    private func getThumbOnPushPos() -> CGPoint {
        return CGPoint(x: (frame.width - frame.height/2.0) - thumbDelta + 3, y: frame.height/2.0)
    }
    
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        if (on) {
            let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
            thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            thumbBoundsAnimation.fromValue = NSValue(CGRect: getThumbOffRect())
            thumbBoundsAnimation.toValue = NSValue(CGRect: getThumbOffPushRect())
            thumbBoundsAnimation.fillMode = kCAFillModeForwards
            thumbBoundsAnimation.duration = 0.25
            thumbBoundsAnimation.removedOnCompletion = false
            
            let thumbPosAnimation = CABasicAnimation(keyPath: "position")
            thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            thumbPosAnimation.fromValue = NSValue(CGPoint: getThumbOnPos())
            thumbPosAnimation.toValue = NSValue(CGPoint: getThumbOnPushPos())
            thumbPosAnimation.fillMode = kCAFillModeForwards
            thumbPosAnimation.duration = 0.25
            thumbPosAnimation.removedOnCompletion = false
            
            let thumbBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
            thumbBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
            thumbBorderColorAnimation.fromValue = thumbOnBorderColor?.CGColor
            thumbBorderColorAnimation.toValue = thumbOnBorderColor?.CGColor
            thumbBorderColorAnimation.fillMode = kCAFillModeForwards
            thumbBorderColorAnimation.duration = 0.25
            thumbBorderColorAnimation.removedOnCompletion = false
            
            let thumbFillColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
            thumbFillColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
            thumbFillColorAnimation.fromValue = thumbOnFillColor?.CGColor
            thumbFillColorAnimation.toValue = thumbOnFillColor?.CGColor
            thumbFillColorAnimation.fillMode = kCAFillModeForwards
            thumbFillColorAnimation.duration = 0.25
            thumbFillColorAnimation.removedOnCompletion = false
            
            let animThumbGroup = CAAnimationGroup()
            animThumbGroup.duration = 0.25
            animThumbGroup.fillMode = kCAFillModeForwards
            animThumbGroup.removedOnCompletion = false
            animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation, thumbBorderColorAnimation, thumbFillColorAnimation]
            
            thumbLayer.removeAllAnimations()
            thumbLayer.addAnimation(animThumbGroup, forKey: "thumbAnimation")
            
        } else {
            let bgBorderAnimation = CABasicAnimation(keyPath: "borderWidth")
            bgBorderAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
            bgBorderAnimation.fromValue = 1
            bgBorderAnimation.toValue = frame.height / 2
            bgBorderAnimation.fillMode = kCAFillModeForwards
            bgBorderAnimation.duration = 0.25
            bgBorderAnimation.removedOnCompletion = false
            
            let bgBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
            bgBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
            bgBorderColorAnimation.fromValue = trackOffBorderColor?.CGColor
            bgBorderColorAnimation.toValue = trackOffPushBorederColor?.CGColor
            bgBorderColorAnimation.fillMode = kCAFillModeForwards
            bgBorderColorAnimation.duration = 0.25
            bgBorderColorAnimation.removedOnCompletion = false
            
            let animGroup = CAAnimationGroup()
            animGroup.duration = 0.25
            animGroup.fillMode = kCAFillModeForwards
            animGroup.removedOnCompletion = false
            animGroup.animations = [bgBorderColorAnimation]
            
            if (shouldFillOnPush) {
                animGroup.animations?.append(bgBorderAnimation)
            }
            
            backLayer.addAnimation(animGroup, forKey: "bgAnimation")
            
            let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
            thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            thumbBoundsAnimation.fromValue = NSValue(CGRect: getThumbOffRect())
            thumbBoundsAnimation.toValue = NSValue(CGRect: getThumbOffPushRect())
            thumbBoundsAnimation.fillMode = kCAFillModeForwards
            thumbBoundsAnimation.duration = 0.25
            thumbBoundsAnimation.removedOnCompletion = false
            
            let thumbPosAnimation = CABasicAnimation(keyPath: "position")
            thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            thumbPosAnimation.fromValue = NSValue(CGPoint: getThumbOffPos())
            thumbPosAnimation.toValue = NSValue(CGPoint: getThumbOffPushPos())
            thumbPosAnimation.fillMode = kCAFillModeForwards
            thumbPosAnimation.duration = 0.25
            thumbPosAnimation.removedOnCompletion = false
            
            let animThumbGroup = CAAnimationGroup()
            animThumbGroup.duration = 0.25
            animThumbGroup.fillMode = kCAFillModeForwards
            animThumbGroup.removedOnCompletion = false
            animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation]
            
            thumbLayer.addAnimation(animThumbGroup, forKey: "thumbAnimation")
        }
    }
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        let touchPoint = touches.first?.locationInView(self)
        if (self.bounds.contains(touchPoint!)) {
            if (on) {
                onToOffAnim()
            } else {
                offToOnAnim()
            }
            
            self.on = !self.on
            
            self.sendActionsForControlEvents(UIControlEvents.ValueChanged)
            
        } else {
            if (on) {
                let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
                thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
                thumbBoundsAnimation.fromValue = NSValue(CGRect: getThumbOffPushRect())
                thumbBoundsAnimation.toValue = NSValue(CGRect: getThumbOffRect())
                thumbBoundsAnimation.fillMode = kCAFillModeForwards
                thumbBoundsAnimation.duration = 0.25
                thumbBoundsAnimation.removedOnCompletion = false
                
                let thumbPosAnimation = CABasicAnimation(keyPath: "position")
                thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
                thumbPosAnimation.fromValue = NSValue(CGPoint: getThumbOnPushPos())
                thumbPosAnimation.toValue = NSValue(CGPoint: getThumbOnPos())
                thumbPosAnimation.fillMode = kCAFillModeForwards
                thumbPosAnimation.duration = 0.25
                thumbPosAnimation.removedOnCompletion = false
                
                
                let thumbBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
                thumbBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
                thumbBorderColorAnimation.fromValue = thumbOnBorderColor?.CGColor
                thumbBorderColorAnimation.toValue = thumbOnBorderColor?.CGColor
                thumbBorderColorAnimation.fillMode = kCAFillModeForwards
                thumbBorderColorAnimation.duration = 0.25
                thumbBorderColorAnimation.removedOnCompletion = false
                
                let thumbFillColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
                thumbFillColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
                thumbFillColorAnimation.fromValue = thumbOnFillColor?.CGColor
                thumbFillColorAnimation.toValue = thumbOnFillColor?.CGColor
                thumbFillColorAnimation.fillMode = kCAFillModeForwards
                thumbFillColorAnimation.duration = 0.25
                thumbFillColorAnimation.removedOnCompletion = false
                
                let animThumbGroup = CAAnimationGroup()
                animThumbGroup.duration = 0.25
                animThumbGroup.fillMode = kCAFillModeForwards
                animThumbGroup.removedOnCompletion = false
                animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation, thumbBorderColorAnimation, thumbFillColorAnimation]
                
                thumbLayer.removeAllAnimations()
                thumbLayer.addAnimation(animThumbGroup, forKey: "thumbAnimation")
                
            } else {
                let bgBorderAnimation = CABasicAnimation(keyPath: "borderWidth")
                bgBorderAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
                bgBorderAnimation.fromValue = frame.height / 2
                bgBorderAnimation.toValue = 1
                bgBorderAnimation.fillMode = kCAFillModeForwards
                bgBorderAnimation.duration = 0.25
                bgBorderAnimation.removedOnCompletion = false
                
                let bgBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
                bgBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
                bgBorderColorAnimation.fromValue = trackOffPushBorederColor?.CGColor
                bgBorderColorAnimation.toValue = trackOffBorderColor?.CGColor
                bgBorderColorAnimation.fillMode = kCAFillModeForwards
                bgBorderColorAnimation.duration = 0.25
                bgBorderColorAnimation.removedOnCompletion = false
                
                let animGroup = CAAnimationGroup()
                animGroup.duration = 0.25
                animGroup.fillMode = kCAFillModeForwards
                animGroup.removedOnCompletion = false
                animGroup.animations = [bgBorderColorAnimation]
                
                if (shouldFillOnPush) {
                    animGroup.animations?.append(bgBorderAnimation)
                }
                
                backLayer.removeAllAnimations()
                backLayer.addAnimation(animGroup, forKey: "bgAnimation")
                
                let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
                thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
                thumbBoundsAnimation.fromValue = NSValue(CGRect: getThumbOffPushRect())
                thumbBoundsAnimation.toValue = NSValue(CGRect: getThumbOffRect())
                thumbBoundsAnimation.fillMode = kCAFillModeForwards
                thumbBoundsAnimation.duration = 0.25
                thumbBoundsAnimation.removedOnCompletion = false
                
                let thumbPosAnimation = CABasicAnimation(keyPath: "position")
                thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
                thumbPosAnimation.fromValue = NSValue(CGPoint: getThumbOffPushPos())
                thumbPosAnimation.toValue = NSValue(CGPoint: getThumbOffPos())
                thumbPosAnimation.fillMode = kCAFillModeForwards
                thumbPosAnimation.duration = 0.25
                thumbPosAnimation.removedOnCompletion = false
                
                let animThumbGroup = CAAnimationGroup()
                animThumbGroup.duration = 0.25
                animThumbGroup.fillMode = kCAFillModeForwards
                animThumbGroup.removedOnCompletion = false
                animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation]
                
                thumbLayer.removeAllAnimations()
                thumbLayer.addAnimation(animThumbGroup, forKey: "thumbAnimation")
            }
        }
    }
    
    private func onToOffAnim() {
        let bgBorderAnimation = CABasicAnimation(keyPath: "borderWidth")
        bgBorderAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        bgBorderAnimation.fromValue = frame.height / 2
        bgBorderAnimation.toValue = 1
        bgBorderAnimation.fillMode = kCAFillModeForwards
        bgBorderAnimation.duration = 0.25
        bgBorderAnimation.removedOnCompletion = false
        
        let bgBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        bgBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        bgBorderColorAnimation.fromValue = trackOnFillColor?.CGColor
        bgBorderColorAnimation.toValue = trackOffBorderColor?.CGColor
        bgBorderColorAnimation.fillMode = kCAFillModeForwards
        bgBorderColorAnimation.duration = 0.25
        bgBorderColorAnimation.removedOnCompletion = false
        
        let animGroup = CAAnimationGroup()
        animGroup.duration = 0.25
        animGroup.fillMode = kCAFillModeForwards
        animGroup.removedOnCompletion = false
        animGroup.animations = [bgBorderColorAnimation]
        
        if (shouldFillOnPush) {
            animGroup.animations?.append(bgBorderAnimation)
        }
        
        backLayer.removeAllAnimations()
        backLayer.addAnimation(animGroup, forKey: "bgAnimation")
        
        let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
        thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        thumbBoundsAnimation.fromValue = NSValue(CGRect: getThumbOffPushRect())
        thumbBoundsAnimation.toValue = NSValue(CGRect: getThumbOffRect())
        thumbBoundsAnimation.fillMode = kCAFillModeForwards
        thumbBoundsAnimation.duration = 0.25
        thumbBoundsAnimation.removedOnCompletion = false
        
        let thumbPosAnimation = CABasicAnimation(keyPath: "position")
        thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        thumbPosAnimation.fromValue = NSValue(CGPoint: getThumbOnPushPos())
        thumbPosAnimation.toValue = NSValue(CGPoint: getThumbOffPos())
        thumbPosAnimation.fillMode = kCAFillModeForwards
        thumbPosAnimation.duration = 0.25
        thumbPosAnimation.removedOnCompletion = false
        
        let thumbBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        thumbBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        thumbBorderColorAnimation.fromValue = thumbOnBorderColor?.CGColor
        thumbBorderColorAnimation.toValue = thumbOffBorderColor?.CGColor
        thumbBorderColorAnimation.fillMode = kCAFillModeForwards
        thumbBorderColorAnimation.duration = 0.25
        thumbBorderColorAnimation.removedOnCompletion = false
        
        let thumbFillColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        thumbFillColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        thumbFillColorAnimation.fromValue = thumbOnFillColor?.CGColor
        thumbFillColorAnimation.toValue = thumbOffFillColor?.CGColor
        thumbFillColorAnimation.fillMode = kCAFillModeForwards
        thumbFillColorAnimation.duration = 0.25
        thumbFillColorAnimation.removedOnCompletion = false
        
        let animThumbGroup = CAAnimationGroup()
        animThumbGroup.duration = 0.25
        animThumbGroup.fillMode = kCAFillModeForwards
        animThumbGroup.removedOnCompletion = false
        animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation, thumbBorderColorAnimation, thumbFillColorAnimation]
        
        thumbLayer.removeAllAnimations()
        thumbLayer.addAnimation(animThumbGroup, forKey: "thumbAnimation")
    }
    
    private func offToOnAnim() {
        
        
        let bgBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        bgBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        bgBorderColorAnimation.fromValue = trackOffPushBorederColor?.CGColor
        bgBorderColorAnimation.toValue = trackOnFillColor?.CGColor
        bgBorderColorAnimation.fillMode = kCAFillModeForwards
        bgBorderColorAnimation.duration = 0.25
        bgBorderColorAnimation.removedOnCompletion = false
        
        backLayer.addAnimation(bgBorderColorAnimation, forKey: "bgOffToOnAnimation")
        
        let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
        thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        thumbBoundsAnimation.fromValue = NSValue(CGRect: getThumbOffPushRect())
        thumbBoundsAnimation.toValue = NSValue(CGRect: getThumbOffRect())
        thumbBoundsAnimation.fillMode = kCAFillModeForwards
        thumbBoundsAnimation.duration = 0.25
        thumbBoundsAnimation.removedOnCompletion = false
        
        let thumbPosAnimation = CABasicAnimation(keyPath: "position")
        thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        thumbPosAnimation.fromValue = NSValue(CGPoint: getThumbOffPushPos())
        thumbPosAnimation.toValue = NSValue(CGPoint: getThumbOnPos())
        thumbPosAnimation.fillMode = kCAFillModeForwards
        thumbPosAnimation.duration = 0.25
        thumbPosAnimation.removedOnCompletion = false
        
        let thumbBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        thumbBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        thumbBorderColorAnimation.fromValue = thumbOffBorderColor?.CGColor
        thumbBorderColorAnimation.toValue = thumbOnBorderColor?.CGColor
        thumbBorderColorAnimation.fillMode = kCAFillModeForwards
        thumbBorderColorAnimation.duration = 0.25
        thumbBorderColorAnimation.removedOnCompletion = false
        
        let thumbFillColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        thumbFillColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        thumbFillColorAnimation.fromValue = thumbOffFillColor?.CGColor
        thumbFillColorAnimation.toValue = thumbOnFillColor?.CGColor
        thumbFillColorAnimation.fillMode = kCAFillModeForwards
        thumbFillColorAnimation.duration = 0.25
        thumbFillColorAnimation.removedOnCompletion = false
        
        let animThumbGroup = CAAnimationGroup()
        animThumbGroup.duration = 0.25
        animThumbGroup.fillMode = kCAFillModeForwards
        animThumbGroup.removedOnCompletion = false
        animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation, thumbBorderColorAnimation, thumbFillColorAnimation]
        
        thumbLayer.removeAllAnimations()
        thumbLayer.addAnimation(animThumbGroup, forKey: "thumbAnimation")
    }
    
    public func setOn(on: Bool, animated :Bool) {
        self.on = on
        
        if (animated) {
            if (on) {
                let bgBorderAnimation = CABasicAnimation(keyPath: "borderWidth")
                bgBorderAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
                bgBorderAnimation.fromValue = 1
                bgBorderAnimation.toValue = frame.height / 2
                bgBorderAnimation.fillMode = kCAFillModeForwards
                bgBorderAnimation.duration = 0.25
                bgBorderAnimation.removedOnCompletion = false
                
                backLayer.addAnimation(bgBorderAnimation, forKey: "bgAnimation")
                
                offToOnAnim()
            } else {
                onToOffAnim()
            }
        } else {
            if (on) {
                if (shouldFillOnPush) {
                    backLayer.borderWidth = frame.height / 2
                }
                
                backLayer.borderColor = trackOnFillColor?.CGColor
                
                thumbLayer.position = getThumbOnPos()
                thumbLayer.borderColor = thumbOnBorderColor?.CGColor
            } else {
                if (shouldFillOnPush) {
                    backLayer.borderWidth = 1
                }
                
                backLayer.borderColor = trackOffFillColor?.CGColor
                
                thumbLayer.position = getThumbOffPos()
                thumbLayer.borderColor = thumbOffBorderColor?.CGColor
            }
        }
    }
    
    override public func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        super.touchesCancelled(touches, withEvent: event)
    }
    
    //helper func
    private func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
