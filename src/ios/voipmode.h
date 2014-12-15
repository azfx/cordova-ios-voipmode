/********* voipmode.h Cordova Plugin Header *******/

#import <Cordova/CDV.h>

@interface VoIPMode : CDVPlugin

- (void)keepSocketAlive:(CDVInvokedUrlCommand*)command;

@end
