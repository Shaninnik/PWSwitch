# PWSwitch

[![CI Status](http://img.shields.io/travis/Nikita Shanin/PWSwitch.svg?style=flat)](https://travis-ci.org/Nikita Shanin/PWSwitch)
[![Version](https://img.shields.io/cocoapods/v/PWSwitch.svg?style=flat)](http://cocoapods.org/pods/PWSwitch)
[![License](https://img.shields.io/cocoapods/l/PWSwitch.svg?style=flat)](http://cocoapods.org/pods/PWSwitch)
[![Platform](https://img.shields.io/cocoapods/p/PWSwitch.svg?style=flat)](http://cocoapods.org/pods/PWSwitch)

Custom UISwitch implementation designed for those who want more control over the looks of the component. Built with CALayers and CAAnimations for finer control and nice interaction visual effects.

- Supports Autolayout
- Supports Storyboard (@IBDesignable, @IBInspectable)
- Can be easily added and configured programmatically
- Global customization with UIAppearance
- Supports standard UISwitch setOn method and ValueChanged control event
- Replicates standard UISwitch animations

## Usage

Simply add 'PWSwitch' init with non-zero rect to your view. *50x26* is the default size, changing it may require adjusting 'thumbDiameter' property

```swift
let pwSwitch = PWSwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 26))
view.addSubview(pwSwitch)
```

Alternatively you can use storyboard and/or autolayout to add 'PWSwitch' to your view.

'PWSwitch' supports standard 'UISwitch' 'setOn(on: Bool, animated :Bool)' method to change state of 'PWSwitch' from code, add sends 'UIControlEvents.ValueChanged' event when state changes. Current state of the control can be obtained with the 'on' property.

```swift
pwSwitch.setOn(true, animated: true)
pwSwitch.addTarget(self, action: #selector(self.onSwitchChanged), forControlEvents: .ValueChanged)
if pwSwitch.on {
    //do something is switch is on
}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

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
