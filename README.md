# TipCalculator
# Pre-work - *TipCalculator*

**TipCalculator** is a tip calculator application for iOS.

Submitted by: **Nalini Shah**

Time spent: **12** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] List anything else that you can get done to improve the app functionality!
1 - Constraints: This ensure application is rendered successfully on portrait and landscape modes on iPhone 5, 6, 6Plus, etc

## Video Walkthrough 

Here's a walkthrough of implemented user stories:
http://i.imgur.com/EVu3vHc.gif

<img src='http://i.imgur.com/EVu3vHc.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
- Working with constraints

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** 
Reactions to the iOS app development platform so far:
- Enjoy working with xcode and swift.
- Storyboards, playgrounds are fun to work with.
- Don’t have to deal with pointers in swift (as yet!) …yay!!
- Still wrapping my head around optionals.
 
How would you describe outlets and actions to another developer?
Outlet -  Outlet is used when you want to change some property of a control i.e. text color or text size of a label displayed on the screen.
Action – Action is used when you want to detect a trigger i.e. when a button is pressed.
 
Outlet and action connections are direct ways that a View Controller can communicate with its View. For example, when a View Controller needs to set the text of a UILabel, it would do so through the outlet connection. When a View’s UIButton object is tapped, it passes the message to the View Controller by using the action connection. This means the outlet created in the View Controller is declared as a @property, and an action is created by declaring a method.
An outlet connection is created when you need to send a message from your code to a user interface object in Xcode’s storyboard. The object can be a control, such as a button, a slider, and a switch, or it can be any other object defined in your storyboard, such as a label and a progress bar. For example, when your code determines that a label should display some texts, the code sends a message through the outlet telling the label to display the new text.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** 
- Closures are self-contained blocks of functionality that can be passed around and used in code. Closures, like classes are reference types.
- Because a closure can capture values from its surrounding scope, a closure can introduce a reference cycle. By default, a closure expression captures constants and variables from its surrounding scope with strong references to those values.
- A reference to a class instance is strong by default. Strong simply means that the class instance the reference points to cannot be deallocated as long as the reference exists.
- A strong reference cycle for closure will occur if and only if:
    1 -  Class instance has a strong reference to closure.
    2 -  Closure has a strong reference to class instance. E.g. The closure’s body accesses a property of the instance, such  as  self.someProperty or the closure calls a method on the instance, such as self.someMethod()
- By replacing a strong  reference with a weak or unowned reference, we break the strong reference cycle and at the same time, we preserve the relationships between the objects. Define a capture in a closure as an unowned or weak reference when the closure and the instance it captures will always refer to each other and will always be deallocated at the same time.

## License

    Copyright [2017] [Nalini Shah]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
