//
//  AppDelegate.m
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import "AppDelegate.h"
#import "GHConst.h"
#import <NXOAuth2Client/NXOAuth2.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];
    NSDictionary *gitHubConfigDict = @{
                                       kNXOAuth2AccountStoreConfigurationClientID: kClientId,
                                       kNXOAuth2AccountStoreConfigurationSecret: kClientSecret,
                                       kNXOAuth2AccountStoreConfigurationScope: [NSSet setWithObjects:@"user", @"repo", nil],
                                       kNXOAuth2AccountStoreConfigurationAuthorizeURL: [NSURL URLWithString:@"https://github.com/login/oauth/authorize"],
                                       kNXOAuth2AccountStoreConfigurationTokenURL: [NSURL URLWithString:@"https://github.com/login/oauth/access_token"],
                                       kNXOAuth2AccountStoreConfigurationRedirectURL: [NSURL URLWithString:@"githubtest://callback"],
                                       kNXOAuth2AccountStoreConfigurationTokenType: @"Bearer"
                                       };
    
    [[NXOAuth2AccountStore sharedStore] setConfiguration:gitHubConfigDict
                                          forAccountType:kServiceName];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSLog(@"handleUrl %@", url);
    [[NXOAuth2AccountStore sharedStore] handleRedirectURL: url];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
