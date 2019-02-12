#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "FlutterJPushPlugin.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self startupJPush:launchOptions appKey:@"42e2a748ac60ce1595e36ded" channel:@"developer-default" isProduction:false];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
