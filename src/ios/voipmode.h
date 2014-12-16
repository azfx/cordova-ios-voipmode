/********* voipmode.h Cordova Plugin Header *******/

#import <Cordova/CDV.h>

@interface CordovaVoIPMode : CDVPlugin

- (void) applicationDidEnterBackground:(NSNotification *)notification;
- (void) applicationWillEnterForeground:(NSNotification *)notification;

@end
