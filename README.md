VBOrientationSpecificViewController
=================================

Allows for separate portrait and landscape views for the same view controller...using Nibs (Xib files).  


#Overview

Sometimes, it's nice to have a separate view for landscape and a separate view for portrait for your iOS app.  Although it is encouraged that you use 
something like AutoLayout or Springs & Struts, they don't always do what you want them to.  For a while, the alternative to these has been to handle 
setting up these views up in your code...but sometimes it's just nice to still be able to use nibs.  

VBOrientationSpecificViewController allows you to specify the landscape and portrait nibs for your iOS devices and automatically loads and unloads the 
views on orientation changes.  It also allows you to cache your views for faster presentation of your views.  


#Usage

An example iOS project has been included in this repository so you can see how to use this component.  

You'll have to first subclass VBOrientationSpecificViewController.  You can then configure the view with these options:

- self.cachesViews allows you to cache the views it creates so the views are loaded a little faster, but this assumes your views take up little memory. By default, this is set to YES.  
- self.delegate allows you to receive notifications about when the portrait and landscape views get loaded. If self.cachesViews is NO, your delegate methods will get called upon every device orientation change and every time your view is reappearing after another view was just popped off of the stack.  

Name your nibs like these: 
YourViewController-portrait~iphone.xib
YourViewController-landscape~iphone.xib
YourViewController-portrait~ipad.xib
YourViewController-landscape~ipad.xib

** Make sure to not set the view outlet in your nibs


#Installation

Install this component using CocoaPods by adding the below to your project's Podfile:

```console
pod install 'VBOrientationSpecificViewController', '~> 0.1.0'
```

#Feedback

I welcome any ideas in the form of emails, stars, and pull requests.  


