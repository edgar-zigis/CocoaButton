# CocoaButton

Stylish UIButton with loading animation capability.
##### Minimum iOS version 11.0

![alt text](https://github.com/edgar-zigis/CocoaButton/blob/master/sample.gif?raw=true)

### Carthage

```
github "edgar-zigis/CocoaButton" ~> 1.0.0
```
### Cocoapods

```
pod 'CocoaButton', '~> 1.0.0'
```
### Usage
```swift
let v = CocoaButton()
v.backgroundColor = UIColor(displayP3Red: 49/255, green: 190/255, blue: 169/255, alpha: 1)
v.shadowColor = UIColor(red: 94/255, green: 186/255, blue: 187/255, alpha: 0.6)
v.startLoading() //  -> starts loader
v.stopLoading() //  -> stops loader
```
### Remarks
It can be used both programmatically and with storyboards. It has all the features of the UIButton. Samples are available at CocoaButtonTest
