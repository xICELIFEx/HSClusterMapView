//
//  HSAppDelegate.m
//  HSClusterMapView
//
//  Created by CocoaPods on 04/02/2015.
//  Copyright (c) 2014 abouzek. All rights reserved.
//

#import "HSAppDelegate.h"
@import GoogleMaps;

@implementation HSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GMSServices provideAPIKey:@"AIzaSyCQ8nAYI5Ykxo7Wv8uWZi06pnawwG_80U4"];
    return YES;
}

@end
