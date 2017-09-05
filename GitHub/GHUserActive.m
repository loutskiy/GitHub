//
//  GHUserActive.m
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import "GHUserActive.h"

static NSString *kACTIVEUSERID = @"activeUserId";

@implementation GHUserActive

+ (NSString *)getActiveUserId {
    return [[NSUserDefaults standardUserDefaults] valueForKey:kACTIVEUSERID];
}

+ (void)setActiveUserId:(NSString *)userId {
    [[NSUserDefaults standardUserDefaults] setValue:userId forKey:kACTIVEUSERID];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)isAuth {
    if ([GHUserActive getActiveUserId] != nil) return true;
    return false;
}

+ (void)makeLogout {
    [[NXOAuth2AccountStore sharedStore]  removeAccount:[GHUserActive getAccount]];
    for (NXOAuth2Account *account in [[NXOAuth2AccountStore sharedStore] accountsWithAccountType:kServiceName]) {
        [[NXOAuth2AccountStore sharedStore]  removeAccount:account];
    };
    NSMutableDictionary *configuration = [NSMutableDictionary dictionaryWithDictionary:[[NXOAuth2AccountStore sharedStore] configurationForAccountType:kServiceName]];
    [configuration setObject:[NSDictionary new] forKey:kNXOAuth2AccountStoreConfigurationCustomHeaderFields];
    [[NXOAuth2AccountStore sharedStore] setConfiguration:configuration forAccountType:kServiceName];

    
    for(NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]) {
        if([[cookie domain] isEqualToString:@"githubtest://callback"]) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:kACTIVEUSERID];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NXOAuth2Account *)getAccount {
    NXOAuth2Account *account = [[NXOAuth2AccountStore sharedStore] accountWithIdentifier:[GHUserActive getActiveUserId]];
    return account;
}

@end
