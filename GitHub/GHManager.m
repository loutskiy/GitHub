//
//  GHManager.m
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import "GHManager.h"

@implementation GHManager

+ (id)sharedManager {
    static GHManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] initWithStartSession];
    });
    return sharedMyManager;
}

+ (void)requestAuthorization {
    [GHUserActive makeLogout];
    [[NXOAuth2AccountStore sharedStore] requestAccessToAccountWithType:kServiceName];
}

- (instancetype)initWithStartSession {
    self = [super init];
    if (self) {
        [self subscribeToNotifications];
    }
    return self;
}

- (void)subscribeToNotifications {
    [[NSNotificationCenter defaultCenter] addObserverForName:NXOAuth2AccountStoreAccountsDidChangeNotification
                                                      object:[NXOAuth2AccountStore sharedStore]
                                                       queue:nil
                                                  usingBlock:^(NSNotification *aNotification){
                                                      NSString *localUserId = [[aNotification.userInfo objectForKey:@"NXOAuth2AccountStoreNewAccountUserInfoKey"] identifier];
                                                      [GHUserActive setActiveUserId:localUserId];
                                                      NSMutableDictionary *configuration = [NSMutableDictionary dictionaryWithDictionary:[[NXOAuth2AccountStore sharedStore] configurationForAccountType:kServiceName]];
                                                      NSDictionary *customHeaderFields = [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"token %@", [[[GHUserActive getAccount] accessToken] accessToken]] forKey:kAuthorization];
                                                      [configuration setObject:customHeaderFields forKey:kNXOAuth2AccountStoreConfigurationCustomHeaderFields];
                                                      [[NXOAuth2AccountStore sharedStore] setConfiguration:configuration forAccountType:kServiceName];
                                                      [self.delegate didDissmissViewController];
                                                  }];
    [[NSNotificationCenter defaultCenter] addObserverForName:NXOAuth2AccountStoreDidFailToRequestAccessNotification
                                                      object:[NXOAuth2AccountStore sharedStore]
                                                       queue:nil
                                                  usingBlock:^(NSNotification *aNotification){
                                                      NSError *error = [aNotification.userInfo objectForKey:NXOAuth2AccountStoreErrorKey];
                                                      [self.delegate didShowAlertViewControllerWithText:error.localizedDescription];
                                                      NSLog(@"error %@", error);
                                                  }];
}

- (void)checkAuthorization {
    if ([GHUserActive isAuth]) {
        NSString *pathUrl = [NSString stringWithFormat:@"user"];
        NSLog(@"pathUrl %@", pathUrl);
        [GHRequest GET:pathUrl withParameters:nil onSuccess:^(id responseObject) {
            [self.delegate didGetAuthState:GHAuthSuccess];
            NSLog(@"response %@", responseObject);
        } onFailure:^(NSError *error) {
            if (error.code != -1009) {
                [self.delegate didGetAuthState:GHLogoutSuccess];
                [GHUserActive makeLogout];
                NSLog(@"error %@", error);
            } else {
                [self.delegate didGetAuthState:GHAuthSuccess];
                [self.delegate didShowAlertViewControllerWithText:error.localizedDescription];
            }
        }];
    } else {
        [self.delegate didGetAuthState:GHLogoutSuccess];
    }
}

@end
