//
//  PWSwitch.swift
//  Pods
//
//  Created by Nikita on 30/08/16.
//
//

import Foundation
import UIKit

@IBDesignable
open class PWSwitch: UIControl {
    
    var backLayer: CALayer!
    var thumbLayer: CALayer!
    
    open var on = false
    
    /// UIAppearance compatible property
    @IBInspectable open dynamic var trackOffBorderColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._trackOffBorderColor }
        set {
            self._trackOffBorderColor = newValue
            self.backLayer.borderColor = _trackOffBorderColor?.cgColor
        }
    }
    fileprivate var _trackOffBorderColor: UIColor?
    
    @IBInspectable open dynamic var trackOffPushBorderColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._trackOffPushBorderColor }
        set {
            self._trackOffPushBorderColor = newValue
        }
    }
    fileprivate var _trackOffPushBorderColor: UIColor?
    
    
    @IBInspectable open dynamic var trackOffFillColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._trackOffFillColor }
        set {
            self._trackOffFillColor = newValue
            self.backLayer.backgroundColor = _trackOffFillColor?.cgColor
        }
    }
    fileprivate var _trackOffFillColor: UIColor?

    @IBInspectable open dynamic var thumbOffBorderColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbOffBorderColor }
        set {
            self._thumbOffBorderColor = newValue
            self.thumbLayer.borderColor = _thumbOffBorderColor?.cgColor
        }
    }
    fileprivate var _thumbOffBorderColor: UIColor?
    
    @IBInspectable open dynamic var thumbOffPushBorderColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbOffPushBorderColor }
        set {
            self._thumbOffPushBorderColor = newValue
        }
    }
    fileprivate var _thumbOffPushBorderColor: UIColor?
    
    @IBInspectable open dynamic var thumbOffFillColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbOffFillColor }
        set {
            self._thumbOffFillColor = newValue
            self.thumbLayer.backgroundColor = _thumbOffFillColor?.cgColor
        }
    }
    fileprivate var _thumbOffFillColor: UIColor?
    
    @IBInspectable open dynamic var trackOnFillColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._trackOnFillColor }
        set {
            self._trackOnFillColor = newValue
        }
    }
    fileprivate var _trackOnFillColor: UIColor?
    
    @IBInspectable open dynamic var trackOnBorderColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._trackOnBorderColor }
        set {
            self._trackOnBorderColor = newValue
        }
    }
    fileprivate var _trackOnBorderColor: UIColor?
    
    
    @IBInspectable open dynamic var thumbOnBorderColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbOnBorderColor }
        set {
            self._thumbOnBorderColor = newValue
        }
    }
    fileprivate var _thumbOnBorderColor: UIColor?
    
    
    @IBInspectable open dynamic var thumbOnFillColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbOnFillColor }
        set {
            self._thumbOnFillColor = newValue
        }
    }
    fileprivate var _thumbOnFillColor: UIColor?

    
    @IBInspectable open dynamic var thumbDiameter: CGFloat { // UI_APPEARANCE_SELECTOR
        get { return self._thumbDiameter }
        set {
            self._thumbDiameter = newValue
            
            self.thumbLayer.frame = getThumbOffRect()
            self.thumbLayer.cornerRadius = thumbDiameter / 2
        }
    }
    fileprivate var _thumbDiameter: CGFloat
    
    @IBInspectable open dynamic var cornerRadius: CGFloat { // UI_APPEARANCE_SELECTOR
        get { return self._cornerRadius }
        set {
            self._cornerRadius = newValue
            
            self.backLayer.cornerRadius = _cornerRadius
        }
    }
    fileprivate var _cornerRadius: CGFloat
    
    @IBInspectable open dynamic var thumbCornerRadius: CGFloat { // UI_APPEARANCE_SELECTOR
        get { return self._thumbCornerRadius }
        set {
            self._thumbCornerRadius = newValue
            
            self.thumbLayer.cornerRadius = _thumbCornerRadius
        }
    }
    fileprivate var _thumbCornerRadius: CGFloat
    
    @IBInspectable open dynamic var shouldFillOnPush: Bool { // UI_APPEARANCE_SELECTOR
        get { return self._shouldFillOnPush }
        set {
            self._shouldFillOnPush = newValue
        }
    }
    fileprivate var _shouldFillOnPush: Bool
    
    @IBInspectable open dynamic var trackInset: CGFloat { // UI_APPEARANCE_SELECTOR
        get { return self._trackInset }
        set {
            self._trackInset = newValue
        }
    }
    fileprivate var _trackInset: CGFloat
    
    
    @IBInspectable open dynamic var thumbShadowColor: UIColor? { // UI_APPEARANCE_SELECTOR
        get { return self._thumbShadowColor }
        set {
            self._thumbShadowColor = newValue
            
            self.thumbLayer.shadowColor = _thumbShadowColor?.cgColor
        }
    }
    fileprivate var _thumbShadowColor: UIColor?
    
    @IBInspectable open dynamic var shadowStrength: CGFloat { // UI_APPEARANCE_SELECTOR
        get { return self._shadowStrength }
        set {
            self._shadowStrength = newValue
            
            self.thumbLayer.shadowOffset = CGSize(width: 0, height: 1.5 * _shadowStrength)
            self.thumbLayer.shadowRadius = 0.6 * (_shadowStrength * 2)
        }
    }
    fileprivate var _shadowStrength: CGFloat
    
    let thumbDelta:CGFloat = 6
    
    let scale = UIScreen.main.scale
    
    override public init(frame: CGRect) {
        self._thumbDiameter = 14
        self._cornerRadius = 13
        self._thumbCornerRadius = 7
        self._shouldFillOnPush = true
        self._trackInset = 0
        self._shadowStrength = 1
        
        super.init(frame: frame)
        
        baseInit()
    }
    
    required public init(coder aDecoder: NSCoder) {
        self._thumbDiameter = 14
        self._cornerRadius = 13
        self._thumbCornerRadius = 7
        self._shouldFillOnPush = true
        self._trackInset = 0
        self._shadowStrength = 1
        
        super.init(coder: aDecoder)!
        
        baseInit()
    }
    
    public init() {
        self._thumbDiameter = 14
        self._cornerRadius = 13
        self._thumbCornerRadius = 7
        self._shouldFillOnPush = true
        self._trackInset = 0
        self._shadowStrength = 1
        
        super.init(frame: CGRect.zero)
        
        baseInit()
    }
    
    fileprivate func baseInit() {
        clipsToBounds = false
        
        //init default style
        self._trackOffBorderColor = UIColorFromRGB(0xB1BBC3)
        self._trackOffPushBorderColor = UIColorFromRGB(0xE0E4E9)
        self._trackOffFillColor = UIColor.clear
        self._trackOnBorderColor = UIColorFromRGB(0xFFB831)
        self._trackOnFillColor = UIColor.clear
        self._thumbOffBorderColor = UIColorFromRGB(0xB1BBC3)
        self._thumbOffPushBorderColor = UIColorFromRGB(0xB1BBC3)
        self._thumbOnBorderColor = UIColorFromRGB(0xF0AA26)
        self._thumbOffFillColor = UIColorFromRGB(0xFFFFFF)
        self._thumbOnFillColor = UIColorFromRGB(0xFFFFFF)
        self._thumbShadowColor = UIColorFromRGB(0x919CA6).withAlphaComponent(0.26)
        
        backLayer = CALayer()
        backLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 26)
        backLayer.cornerRadius = _cornerRadius
        backLayer.borderWidth = 1
        backLayer.borderColor = _trackOffBorderColor?.cgColor
        backLayer.backgroundColor = _trackOffFillColor?.cgColor
        layer.addSublayer(backLayer)
        
        thumbLayer = CALayer()
        thumbLayer.frame = getThumbOffRect()
        thumbLayer.cornerRadius = _thumbCornerRadius
        thumbLayer.backgroundColor = _thumbOffFillColor?.cgColor
        thumbLayer.borderWidth = 1
        thumbLayer.shadowOffset = CGSize(width: 0, height: 1.5 * _shadowStrength)
        thumbLayer.shadowRadius = 0.6 * (_shadowStrength * 2)
        thumbLayer.shadowColor = _thumbShadowColor?.cgColor
        thumbLayer.shadowOpacity = 1
        thumbLayer.borderColor = _thumbOffBorderColor?.cgColor
        
        layer.addSublayer(thumbLayer)
    }
    
    override open var intrinsicContentSize : CGSize {
        return CGSize(width: 50, height: 26)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        backLayer.frame = CGRect(x: 0 + trackInset, y: 0 + trackInset, width: frame.width - trackInset*2.0, height: frame.height - trackInset*2.0)
        
        if (on) {
            thumbLayer.frame = getThumbOnRect()
            
            if (shouldFillOnPush) {
                backLayer.borderWidth = frame.height / 2
            }
            
        } else {
            thumbLayer.frame = getThumbOffRect()
        }
    }
    
    fileprivate func getThumbOffRect() -> CGRect {
        return CGRect(x: (frame.height - thumbDiameter)/2.0, y: (frame.height - thumbDiameter)/2.0, width: thumbDiameter, height: thumbDiameter)
    }
    
    fileprivate func getThumbOffPushRect() -> CGRect {
        return CGRect(x: (frame.height - thumbDiameter)/2.0, y: (frame.height - thumbDiameter)/2.0, width: thumbDiameter + thumbDelta, height: thumbDiameter)
    }
    
    fileprivate func getThumbOnRect() -> CGRect {
        return CGRect(x: frame.width - thumbDiameter - ((frame.height - thumbDiameter)/2.0), y: (frame.height - thumbDiameter)/2.0, width: thumbDiameter, height: thumbDiameter)
    }
    
    fileprivate func getThumbOffPos() -> CGPoint {
        return CGPoint(x: frame.height/2.0, y: frame.height/2.0)
    }
    
    fileprivate func getThumbOffPushPos() -> CGPoint {
        return CGPoint(x: frame.height/2.0 + thumbDelta - 3, y: frame.height/2.0)
    }
    
    fileprivate func getThumbOnPos() -> CGPoint {
        return CGPoint(x: frame.width - frame.height/2.0, y: frame.height/2.0)
    }
    
    fileprivate func getThumbOnPushPos() -> CGPoint {
        return CGPoint(x: (frame.width - frame.height/2.0) - thumbDelta + 3, y: frame.height/2.0)
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if (on) {
            let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
            thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            thumbBoundsAnimation.fromValue = NSValue(cgRect: getThumbOffRect())
            thumbBoundsAnimation.toValue = NSValue(cgRect: getThumbOffPushRect())
            thumbBoundsAnimation.fillMode = kCAFillModeForwards
            thumbBoundsAnimation.duration = 0.25
            thumbBoundsAnimation.isRemovedOnCompletion = false
            
            let thumbPosAnimation = CABasicAnimation(keyPath: "position")
            thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            thumbPosAnimation.fromValue = NSValue(cgPoint: getThumbOnPos())
            thumbPosAnimation.toValue = NSValue(cgPoint: getThumbOnPushPos())
            thumbPosAnimation.fillMode = kCAFillModeForwards
            thumbPosAnimation.duration = 0.25
            thumbPosAnimation.isRemovedOnCompletion = false
            
            let thumbBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
            thumbBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
            thumbBorderColorAnimation.fromValue = thumbOnBorderColor?.cgColor
            thumbBorderColorAnimation.toValue = thumbOnBorderColor?.cgColor
            thumbBorderColorAnimation.fillMode = kCAFillModeForwards
            thumbBorderColorAnimation.duration = 0.25
            thumbBorderColorAnimation.isRemovedOnCompletion = false
            
            let thumbFillColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
            thumbFillColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
            thumbFillColorAnimation.fromValue = thumbOnFillColor?.cgColor
            thumbFillColorAnimation.toValue = thumbOnFillColor?.cgColor
            thumbFillColorAnimation.fillMode = kCAFillModeForwards
            thumbFillColorAnimation.duration = 0.25
            thumbFillColorAnimation.isRemovedOnCompletion = false
            
            let animThumbGroup = CAAnimationGroup()
            animThumbGroup.duration = 0.25
            animThumbGroup.fillMode = kCAFillModeForwards
            animThumbGroup.isRemovedOnCompletion = false
            animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation, thumbBorderColorAnimation, thumbFillColorAnimation]
            
            thumbLayer.removeAllAnimations()
            thumbLayer.add(animThumbGroup, forKey: "thumbAnimation")
            
        } else {
            let bgBorderAnimation = CABasicAnimation(keyPath: "borderWidth")
            bgBorderAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
            bgBorderAnimation.fromValue = 1
            bgBorderAnimation.toValue = frame.height / 2
            bgBorderAnimation.fillMode = kCAFillModeForwards
            bgBorderAnimation.duration = 0.25
            bgBorderAnimation.isRemovedOnCompletion = false
            
            let bgBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
            bgBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
            bgBorderColorAnimation.fromValue = trackOffBorderColor?.cgColor
            bgBorderColorAnimation.toValue = trackOffPushBorderColor?.cgColor
            bgBorderColorAnimation.fillMode = kCAFillModeForwards
            bgBorderColorAnimation.duration = 0.25
            bgBorderColorAnimation.isRemovedOnCompletion = false
            
            let animGroup = CAAnimationGroup()
            animGroup.duration = 0.25
            animGroup.fillMode = kCAFillModeForwards
            animGroup.isRemovedOnCompletion = false
            animGroup.animations = [bgBorderColorAnimation]
            
            if (shouldFillOnPush) {
                animGroup.animations?.append(bgBorderAnimation)
            }
            
            backLayer.add(animGroup, forKey: "bgAnimation")
            
            let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
            thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            thumbBoundsAnimation.fromValue = NSValue(cgRect: getThumbOffRect())
            thumbBoundsAnimation.toValue = NSValue(cgRect: getThumbOffPushRect())
            thumbBoundsAnimation.fillMode = kCAFillModeForwards
            thumbBoundsAnimation.duration = 0.25
            thumbBoundsAnimation.isRemovedOnCompletion = false
            
            let thumbPosAnimation = CABasicAnimation(keyPath: "position")
            thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            thumbPosAnimation.fromValue = NSValue(cgPoint: getThumbOffPos())
            thumbPosAnimation.toValue = NSValue(cgPoint: getThumbOffPushPos())
            thumbPosAnimation.fillMode = kCAFillModeForwards
            thumbPosAnimation.duration = 0.25
            thumbPosAnimation.isRemovedOnCompletion = false
            
            let thumbBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
            thumbBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
            thumbBorderColorAnimation.fromValue = thumbOffBorderColor?.cgColor
            thumbBorderColorAnimation.toValue = thumbOffPushBorderColor?.cgColor
            thumbBorderColorAnimation.fillMode = kCAFillModeForwards
            thumbBorderColorAnimation.duration = 0.25
            thumbBorderColorAnimation.isRemovedOnCompletion = false
            
            let animThumbGroup = CAAnimationGroup()
            animThumbGroup.duration = 0.25
            animThumbGroup.fillMode = kCAFillModeForwards
            animThumbGroup.isRemovedOnCompletion = false
            animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation, thumbBorderColorAnimation]
            
            thumbLayer.add(animThumbGroup, forKey: "thumbAnimation")
        }
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        let touchPoint = touches.first?.location(in: self)
        if (self.bounds.contains(touchPoint!)) {
            if (on) {
                onToOffAnim()
            } else {
                offToOnAnim()
            }
            
            self.on = !self.on
            
            self.sendActions(for: UIControlEvents.valueChanged)
            
        } else {
            if (on) {
                let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
                thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
                thumbBoundsAnimation.fromValue = NSValue(cgRect: getThumbOffPushRect())
                thumbBoundsAnimation.toValue = NSValue(cgRect: getThumbOffRect())
                thumbBoundsAnimation.fillMode = kCAFillModeForwards
                thumbBoundsAnimation.duration = 0.25
                thumbBoundsAnimation.isRemovedOnCompletion = false
                
                let thumbPosAnimation = CABasicAnimation(keyPath: "position")
                thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
                thumbPosAnimation.fromValue = NSValue(cgPoint: getThumbOnPushPos())
                thumbPosAnimation.toValue = NSValue(cgPoint: getThumbOnPos())
                thumbPosAnimation.fillMode = kCAFillModeForwards
                thumbPosAnimation.duration = 0.25
                thumbPosAnimation.isRemovedOnCompletion = false
                
                
                let thumbBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
                thumbBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
                thumbBorderColorAnimation.fromValue = thumbOnBorderColor?.cgColor
                thumbBorderColorAnimation.toValue = thumbOnBorderColor?.cgColor
                thumbBorderColorAnimation.fillMode = kCAFillModeForwards
                thumbBorderColorAnimation.duration = 0.25
                thumbBorderColorAnimation.isRemovedOnCompletion = false
                
                let thumbFillColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
                thumbFillColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
                thumbFillColorAnimation.fromValue = thumbOnFillColor?.cgColor
                thumbFillColorAnimation.toValue = thumbOnFillColor?.cgColor
                thumbFillColorAnimation.fillMode = kCAFillModeForwards
                thumbFillColorAnimation.duration = 0.25
                thumbFillColorAnimation.isRemovedOnCompletion = false
                
                let animThumbGroup = CAAnimationGroup()
                animThumbGroup.duration = 0.25
                animThumbGroup.fillMode = kCAFillModeForwards
                animThumbGroup.isRemovedOnCompletion = false
                animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation, thumbBorderColorAnimation, thumbFillColorAnimation]
                
                thumbLayer.removeAllAnimations()
                thumbLayer.add(animThumbGroup, forKey: "thumbAnimation")
                
            } else {
                let bgBorderAnimation = CABasicAnimation(keyPath: "borderWidth")
                bgBorderAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
                bgBorderAnimation.fromValue = frame.height / 2
                bgBorderAnimation.toValue = 1
                bgBorderAnimation.fillMode = kCAFillModeForwards
                bgBorderAnimation.duration = 0.25
                bgBorderAnimation.isRemovedOnCompletion = false
                
                let bgBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
                bgBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
                bgBorderColorAnimation.fromValue = trackOffPushBorderColor?.cgColor
                bgBorderColorAnimation.toValue = trackOffBorderColor?.cgColor
                bgBorderColorAnimation.fillMode = kCAFillModeForwards
                bgBorderColorAnimation.duration = 0.25
                bgBorderColorAnimation.isRemovedOnCompletion = false
                
                let animGroup = CAAnimationGroup()
                animGroup.duration = 0.25
                animGroup.fillMode = kCAFillModeForwards
                animGroup.isRemovedOnCompletion = false
                animGroup.animations = [bgBorderColorAnimation]
                
                if (shouldFillOnPush) {
                    animGroup.animations?.append(bgBorderAnimation)
                }
                
                backLayer.removeAllAnimations()
                backLayer.add(animGroup, forKey: "bgAnimation")
                
                let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
                thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
                thumbBoundsAnimation.fromValue = NSValue(cgRect: getThumbOffPushRect())
                thumbBoundsAnimation.toValue = NSValue(cgRect: getThumbOffRect())
                thumbBoundsAnimation.fillMode = kCAFillModeForwards
                thumbBoundsAnimation.duration = 0.25
                thumbBoundsAnimation.isRemovedOnCompletion = false
                
                let thumbPosAnimation = CABasicAnimation(keyPath: "position")
                thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
                thumbPosAnimation.fromValue = NSValue(cgPoint: getThumbOffPushPos())
                thumbPosAnimation.toValue = NSValue(cgPoint: getThumbOffPos())
                thumbPosAnimation.fillMode = kCAFillModeForwards
                thumbPosAnimation.duration = 0.25
                thumbPosAnimation.isRemovedOnCompletion = false
                
                let thumbBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
                thumbBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
                thumbBorderColorAnimation.fromValue = thumbOffPushBorderColor?.cgColor
                thumbBorderColorAnimation.toValue = thumbOffBorderColor?.cgColor
                thumbBorderColorAnimation.fillMode = kCAFillModeForwards
                thumbBorderColorAnimation.duration = 0.25
                thumbBorderColorAnimation.isRemovedOnCompletion = false
                
                let animThumbGroup = CAAnimationGroup()
                animThumbGroup.duration = 0.25
                animThumbGroup.fillMode = kCAFillModeForwards
                animThumbGroup.isRemovedOnCompletion = false
                animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation, thumbBorderColorAnimation]
                
                thumbLayer.removeAllAnimations()
                thumbLayer.add(animThumbGroup, forKey: "thumbAnimation")
            }
        }
    }
    
    fileprivate func onToOffAnim() {
        let bgBorderAnimation = CABasicAnimation(keyPath: "borderWidth")
        bgBorderAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        bgBorderAnimation.fromValue = frame.height / 2
        bgBorderAnimation.toValue = 1
        bgBorderAnimation.fillMode = kCAFillModeForwards
        bgBorderAnimation.duration = 0.25
        bgBorderAnimation.isRemovedOnCompletion = false
        
        let bgBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        bgBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        bgBorderColorAnimation.fromValue = trackOnBorderColor?.cgColor
        bgBorderColorAnimation.toValue = trackOffBorderColor?.cgColor
        bgBorderColorAnimation.fillMode = kCAFillModeForwards
        bgBorderColorAnimation.duration = 0.25
        bgBorderColorAnimation.isRemovedOnCompletion = false
        
        let bgFillColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        bgFillColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        bgFillColorAnimation.fromValue = trackOnFillColor?.cgColor
        bgFillColorAnimation.toValue = trackOffFillColor?.cgColor
        bgFillColorAnimation.fillMode = kCAFillModeForwards
        bgFillColorAnimation.duration = 0.25
        bgFillColorAnimation.isRemovedOnCompletion = false
        
        let animGroup = CAAnimationGroup()
        animGroup.duration = 0.25
        animGroup.fillMode = kCAFillModeForwards
        animGroup.isRemovedOnCompletion = false
        animGroup.animations = [bgBorderColorAnimation, bgFillColorAnimation]
        
        if (shouldFillOnPush) {
            animGroup.animations?.append(bgBorderAnimation)
        }
        
        backLayer.removeAllAnimations()
        backLayer.add(animGroup, forKey: "bgAnimation")
        
        let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
        thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        thumbBoundsAnimation.fromValue = NSValue(cgRect: getThumbOffPushRect())
        thumbBoundsAnimation.toValue = NSValue(cgRect: getThumbOffRect())
        thumbBoundsAnimation.fillMode = kCAFillModeForwards
        thumbBoundsAnimation.duration = 0.25
        thumbBoundsAnimation.isRemovedOnCompletion = false
        
        let thumbPosAnimation = CABasicAnimation(keyPath: "position")
        thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        thumbPosAnimation.fromValue = NSValue(cgPoint: getThumbOnPushPos())
        thumbPosAnimation.toValue = NSValue(cgPoint: getThumbOffPos())
        thumbPosAnimation.fillMode = kCAFillModeForwards
        thumbPosAnimation.duration = 0.25
        thumbPosAnimation.isRemovedOnCompletion = false
        
        let thumbBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        thumbBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        thumbBorderColorAnimation.fromValue = thumbOnBorderColor?.cgColor
        thumbBorderColorAnimation.toValue = thumbOffBorderColor?.cgColor
        thumbBorderColorAnimation.fillMode = kCAFillModeForwards
        thumbBorderColorAnimation.duration = 0.25
        thumbBorderColorAnimation.isRemovedOnCompletion = false
        
        let thumbFillColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        thumbFillColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        thumbFillColorAnimation.fromValue = thumbOnFillColor?.cgColor
        thumbFillColorAnimation.toValue = thumbOffFillColor?.cgColor
        thumbFillColorAnimation.fillMode = kCAFillModeForwards
        thumbFillColorAnimation.duration = 0.25
        thumbFillColorAnimation.isRemovedOnCompletion = false
        
        let animThumbGroup = CAAnimationGroup()
        animThumbGroup.duration = 0.25
        animThumbGroup.fillMode = kCAFillModeForwards
        animThumbGroup.isRemovedOnCompletion = false
        animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation, thumbBorderColorAnimation, thumbFillColorAnimation]
        
        thumbLayer.removeAllAnimations()
        thumbLayer.add(animThumbGroup, forKey: "thumbAnimation")
    }
    
    fileprivate func offToOnAnim() {
        
        
        let bgBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        bgBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        bgBorderColorAnimation.fromValue = trackOffPushBorderColor?.cgColor
        bgBorderColorAnimation.toValue = trackOnBorderColor?.cgColor
        bgBorderColorAnimation.fillMode = kCAFillModeForwards
        bgBorderColorAnimation.duration = 0.25
        bgBorderColorAnimation.isRemovedOnCompletion = false
        
        let bgFillColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        bgFillColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        bgFillColorAnimation.fromValue = trackOffFillColor?.cgColor
        bgFillColorAnimation.toValue = trackOnFillColor?.cgColor
        bgFillColorAnimation.fillMode = kCAFillModeForwards
        bgFillColorAnimation.duration = 0.25
        bgFillColorAnimation.isRemovedOnCompletion = false
        
        let animTrackGroup = CAAnimationGroup()
        animTrackGroup.duration = 0.25
        animTrackGroup.fillMode = kCAFillModeForwards
        animTrackGroup.isRemovedOnCompletion = false
        animTrackGroup.animations = [bgBorderColorAnimation, bgFillColorAnimation]
        
        backLayer.add(animTrackGroup, forKey: "bgOffToOnAnimation")
        
        let thumbBoundsAnimation = CABasicAnimation(keyPath: "bounds")
        thumbBoundsAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        thumbBoundsAnimation.fromValue = NSValue(cgRect: getThumbOffPushRect())
        thumbBoundsAnimation.toValue = NSValue(cgRect: getThumbOffRect())
        thumbBoundsAnimation.fillMode = kCAFillModeForwards
        thumbBoundsAnimation.duration = 0.25
        thumbBoundsAnimation.isRemovedOnCompletion = false
        
        let thumbPosAnimation = CABasicAnimation(keyPath: "position")
        thumbPosAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        thumbPosAnimation.fromValue = NSValue(cgPoint: getThumbOffPushPos())
        thumbPosAnimation.toValue = NSValue(cgPoint: getThumbOnPos())
        thumbPosAnimation.fillMode = kCAFillModeForwards
        thumbPosAnimation.duration = 0.25
        thumbPosAnimation.isRemovedOnCompletion = false
        
        let thumbBorderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        thumbBorderColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        thumbBorderColorAnimation.fromValue = thumbOffPushBorderColor?.cgColor
        thumbBorderColorAnimation.toValue = thumbOnBorderColor?.cgColor
        thumbBorderColorAnimation.fillMode = kCAFillModeForwards
        thumbBorderColorAnimation.duration = 0.25
        thumbBorderColorAnimation.isRemovedOnCompletion = false
        
        let thumbFillColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        thumbFillColorAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        thumbFillColorAnimation.fromValue = thumbOffFillColor?.cgColor
        thumbFillColorAnimation.toValue = thumbOnFillColor?.cgColor
        thumbFillColorAnimation.fillMode = kCAFillModeForwards
        thumbFillColorAnimation.duration = 0.25
        thumbFillColorAnimation.isRemovedOnCompletion = false
        
        let animThumbGroup = CAAnimationGroup()
        animThumbGroup.duration = 0.25
        animThumbGroup.fillMode = kCAFillModeForwards
        animThumbGroup.isRemovedOnCompletion = false
        animThumbGroup.animations = [thumbBoundsAnimation, thumbPosAnimation, thumbBorderColorAnimation, thumbFillColorAnimation]
        
        thumbLayer.removeAllAnimations()
        thumbLayer.add(animThumbGroup, forKey: "thumbAnimation")
    }
    
    open func setOn(_ on: Bool, animated :Bool) {
        self.on = on
        
        if (animated) {
            if (on) {
                let bgBorderAnimation = CABasicAnimation(keyPath: "borderWidth")
                bgBorderAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
                bgBorderAnimation.fromValue = 1
                bgBorderAnimation.toValue = frame.height / 2
                bgBorderAnimation.fillMode = kCAFillModeForwards
                bgBorderAnimation.duration = 0.25
                bgBorderAnimation.isRemovedOnCompletion = false
                
                backLayer.add(bgBorderAnimation, forKey: "bgAnimation")
                
                offToOnAnim()
            } else {
                onToOffAnim()
            }
        } else {
            if (on) {
                if (shouldFillOnPush) {
                    backLayer.borderWidth = frame.height / 2
                }
                
                backLayer.borderColor = trackOnBorderColor?.cgColor
                
                thumbLayer.position = getThumbOnPos()
                thumbLayer.borderColor = thumbOnBorderColor?.cgColor
            } else {
                if (shouldFillOnPush) {
                    backLayer.borderWidth = 1
                }
                
                backLayer.borderColor = trackOffFillColor?.cgColor
                
                thumbLayer.position = getThumbOffPos()
                thumbLayer.borderColor = thumbOffBorderColor?.cgColor
            }
        }
    }
    
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
    }
    
    //helper func
    fileprivate func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
