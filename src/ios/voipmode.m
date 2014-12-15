/********* Echo.m Cordova Plugin Implementation *******/

#import "voipmode.h"
#import <Cordova/CDV.h>

@implementation VoIPMode

#pragma mark -
#pragma mark Initialization methods

/**
 * Initialize the plugin.
 */
- (void) pluginInitialize
{
    [self disable:NULL];
    [self observeLifeCycle];
}

/**
 * Register the listener for pause and resume events.
 */
- (void) observeLifeCycle
{
    NSNotificationCenter* listener = [NSNotificationCenter defaultCenter];

    if (&UIApplicationDidEnterBackgroundNotification && &UIApplicationWillEnterForegroundNotification) {

        [listener addObserver:self
                     selector:@selector(applicationDidEnterBackground)
                         name:UIApplicationDidEnterBackgroundNotification
                       object:nil];

        [listener addObserver:self
                     selector:@selector(stopKeepingAwake)
                         name:UIApplicationWillEnterForegroundNotification
                       object:nil];

    } else {

        //Do something else
    }
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    //TO DO
    //Register/Ensure connection is established with the gateway ?

    BOOL backgroundAccepted = [[UIApplication sharedApplication] setKeepAliveTimeout:600 handler:^{ [self backgroundHandler]; }];
    if (backgroundAccepted)
    {
        NSLog(@"VOIP backgrounding accepted");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[UIApplication sharedApplication] clearKeepAliveTimeout];
    NSLog(@"stoppingKeepAliveTimeout");
}

- (void)backgroundHandler {

    NSLog(@"### -->VOIP backgrounding callback"); // What to do here to extend timeout?

    //TO DO
    // Continue ensuring the client is connected to the webrtc gateway..
}


- (void)keepSocketAlive:(CDVInvokedUrlCommand*)command
{

    NSLog(@"### -->VOIP keepSocketAlive callback");

    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
