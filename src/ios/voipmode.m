/********* voipmode.m Cordova Plugin Implementation *******/

#import "voipmode.h"
#import <Cordova/CDV.h>

@implementation CordovaVoIPMode

NSString *const kAPPBackgroundJsNamespace = @"cordova.plugins.voipMode";
NSString *const kAPPBackgroundEventSleeping = @"Sleeping";


#pragma mark -
#pragma mark Initialization methods

/**
 * Initialize the plugin.
 */
- (void) pluginInitialize
{
   // [self disable:NULL];
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
                     selector:@selector(applicationDidEnterBackground:)
                         name:UIApplicationDidEnterBackgroundNotification
                       object:nil];

        [listener addObserver:self
                     selector:@selector(applicationWillEnterForeground:)
                         name:UIApplicationWillEnterForegroundNotification
                       object:nil];

    } else {

        //Do something else
    }
}


- (void)applicationDidEnterBackground:(NSNotification *) notification
{
    //TO DO
    //Register/Ensure connection is established with the gateway ?

    BOOL backgroundAccepted = [[UIApplication sharedApplication] setKeepAliveTimeout:600 handler:^{ [self backgroundHandler]; }];
    if (backgroundAccepted)
    {
        NSLog(@"VOIP backgrounding accepted");
    }
}

- (void)applicationWillEnterForeground:(NSNotification *) notification
{
    [[UIApplication sharedApplication] clearKeepAliveTimeout];
    NSLog(@"stoppingKeepAliveTimeout");
}

- (void)backgroundHandler {

    NSLog(@"### -->VOIP backgrounding callback"); // What to do here to extend timeout?

    //TO DO
    // Continue ensuring the client is connected to the webrtc gateway..
    [self fireEvent:kAPPBackgroundEventSleeping withParams:NULL];
}


// - (void)keepSocketAlive:(CDVInvokedUrlCommand*)command
// {
//
//     NSLog(@"### -->VOIP keepSocketAlive callback");
//
//     CDVPluginResult* pluginResult = nil;
//     NSString* echo = [command.arguments objectAtIndex:0];
//
//     if (echo != nil && [echo length] > 0) {
//         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
//     } else {
//         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
//     }
//
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }


/**
 * Method to fire an event with some parameters in the browser.
 */
- (void) fireEvent:(NSString*)event withParams:(NSString*)params
{
    NSString* js = [NSString stringWithFormat:@"setTimeout('%@.on%@(%@)',0);",
                    kAPPBackgroundJsNamespace, event, params];

    [self.commandDelegate evalJs:js];
}



@end
