# PWSwitch

[![Version](https://img.shields.io/cocoapods/v/PWSwitch.svg?style=flat)](http://cocoapods.org/pods/PWSwitch)
![Platform: iOS 8+](https://img.shields.io/badge/platform-iOS%208%2B-blue.svg?style=flat)
[![Language: Swift 5](https://img.shields.io/badge/language-swift5-f48041.svg?style=flat)](https://developer.apple.com/swift)
[![License](https://img.shields.io/cocoapods/l/PWSwitch.svg?style=flat)](http://cocoapods.org/pods/PWSwitch)

Custom `UISwitch` implementation designed for those who want more control over the looks of the component. Built with `CALayer` and `CAAnimation` for finer control and nice interaction visual effects.

- Supports Autolayout
- Supports Storyboard (@IBDesignable, @IBInspectable)
- Can be easily added and configured programmatically
- Global customization with UIAppearance
- Supports standard UISwitch setOn method and ValueChanged control event
- Replicates standard UISwitch visual feedback animations

## 1.1 version breaking changes

- Renamed `trackOnFillColor` to `trackOnBorderColor` and added real `trackOnFillColor` property which works only if `shouldFillOnPush` is set to false. To restore previous behavior rename `trackOnFillColor` to `trackOnBorderColor` in your project everywhere you use it and then set new `trackOnFillColor` to clear. (should be by default)
- Added `thumbOffPushBorderColor`. If you have changed default `thumbOffBorderColor` then you probably need to adjust `thumbOffPushBorderColor` now also.

## Usage

Simply add `PWSwitch` init with non-zero rect to your view. *50x26* is the default size, changing it may require adjusting `thumbDiameter` property

```swift
let pwSwitch = PWSwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 26))
view.addSubview(pwSwitch)
```

![PWSwitch default example](/Example/Assets/switch_1.gif)

Alternatively you can use storyboard and/or autolayout to add `PWSwitch` to your view.

`PWSwitch` supports standard `UISwitch` `setOn(on: Bool, animated :Bool)` method to change state of `PWSwitch` from code, add sends `UIControlEvents.ValueChanged` event when state changes. Current state of the control can be obtained with the `on` property.

```swift
pwSwitch.setOn(true, animated: true)
pwSwitch.addTarget(self, action: #selector(self.onSwitchChanged), forControlEvents: .ValueChanged)
if pwSwitch.on {
    //do something is switch is on
}
```

`PWSwitch` has a wide number of properties to customize it's appearance. All properties can be set globally with the `UIAppearance` proxy: `PWSwitch.appearance()`, or directly in code or Interface Builder attribute inspector. Global values set with the `UIAppearance` can be overriden for specific instance by changing their property values directly.

- `trackOffBorderColor` - track border color when state is Off
- `trackOffPushBorderColor` - track border color when switch is pressed (touch began, but not ended). Border width is animated and fills inside of the track completely if `shouldFillOnPush` is true
- `trackOffFillColor` - track fill color when state is Off
- `thumbOffBorderColor` - thumb border color when state is Off
- `thumbOffPushBorderColor` - thumb border color when switch is pressed (touch began, but not ended). Set to the same value as `thumbOffBorderColor` if border color animation is not desireable
- `thumbOffFillColor` - thumb fill color when state is Off
- `trackBorderFillColor` - track border color when state is On. If `shouldFillOnPush` is true then border completely fills track
- `trackOnFillColor` - track fill color when state is On
- `thumbOnBorderColor` - thumb border color when state is On
- `thumbOnFillColor` - thumb fill color when state is On
- `thumbDiameter` - diameter of thumb in pixels
- `cornerRadius` - track corner radius
- `thumbCornerRadius` - thumb corner radius
- `shouldFillOnPush` - track border width is animated and fills inside of the track completely when switch is pressed if true
- `trackInset` - track inset from the outer control frame. Usable if thumb is bigger than track
- `thumbShadowColor` - thumb shadow color. Alpha value can be used to change shadow opacity
- `shadowStrength` - overall strength of thumb shadow
- `thumbDelta` - how much thumb grows when touhes begin. Setting to `0` will disable thumb growing/shrinking

## Issues

Values set with the `PWSwitch.appearance()` override `@IBInspectable` values set it the Interface Builder attributes inspector.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 8.3+ 
- Xcode 8.0+
- Swift 3.0+

Please use release 1.0.0 for the final Swift 2.x supported version.

## Installation

PWSwitch is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PWSwitch"
```

## Author

Nikita Shanin, shaninnik@gmail.com

## License

PWSwitch is available under the MIT license. See the LICENSE file for more info.
