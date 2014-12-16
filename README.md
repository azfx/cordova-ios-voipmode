Cordova iOS VoIP Mode
====================

Simple plugin to enable VoIP settings in iOS. Compatible with [plugman](https://github.com/apache/cordova-plugman). Built upon the [Cordova Echo plugin example](http://cordova.apache.org/docs/en/3.0.0/guide_hybrid_plugins_index.md.html#Plugin%20Development%20Guide).

### Plugin's Purpose
This cordova plug-in is created to ease the implementation of "voip" background mode in iOS Applications.
The plugin enables the following background modes in an iOS App :

1. voip
2. audio

In addition, the plugin exposes interfaces to manage application's background state.

For more information, refer [App Programing Guide for iOS: Background Execution] (https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/BackgroundExecution/BackgroundExecution.html)

## Usage
The plugin creates the object `cordova.plugins.voipMode` with  the following methods:

1. [voipMode.didEnterBackground][didEnterBackground]
2. [voipMode.inSuspendedState][inSuspendedState]
3. [voipMode.willEnterForeground][willEnterForeground]

### Get notified when the application enters background.
The `voipMode.didEnterBackground` interface can be used to get notified when the app goes to backround.

```javascript
cordova.plugins.voipMode.didEnterBackground = function() {};
```

### Execute keep alive routines when application stays in background.
The `voipMode.inSuspendedState` interface can be used to execute keep alive routines to stay connected with voip server while the app stays suspended.

```javascript
cordova.plugins.voipMode.inSuspendedState = function() {};
```

### Get notified when the application is ready to enter foreground.
The `voipMode.willEnterForeground` interface can be used to get notified when the app is ready to enter foreground.

```javascript
cordova.plugins.voipMode.willEnterForeground = function() {};
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[didEnterBackground]: #get-notified-when-the-application-enters-background
[inSuspendedState]: #execute-keep-alive-routines-when-application-in-suspended-state
[willEnterForeground]: #get-notified-when-the-application-is-ready-to-enter-foreground
