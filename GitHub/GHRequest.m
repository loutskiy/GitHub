//
//  GHRequest.m
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import "GHRequest.h"
#import <NXOAuth2Client/NXOAuth2.h>
#import "GHUserActive.h"
#import "GHConst.h"

@implementation GHRequest

+ (void)POST:(NSString *)urlString withParameters:(NSDictionary *)parameters onSuccess:(GHRequestSuccessHandler)successHandler onFailure:(GHRequestErrorHandler)failureHandler {
    [NXOAuth2Request performMethod:@"POST"
                        onResource:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kAPI, urlString]]
                   usingParameters:parameters
                       withAccount:[GHUserActive getAccount]
               sendProgressHandler:nil
                   responseHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
                       if (error != nil) {
                           failureHandler (error);
                       } else {
                           successHandler(responseData);
                       }
                   }];
}

+ (void)GET:(NSString *)urlString withParameters:(NSDictionary *)parameters onSuccess:(GHRequestSuccessHandler)successHandler onFailure:(GHRequestErrorHandler)failureHandler {
    [NXOAuth2Request performMethod:@"GET"
                        onResource:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kAPI, urlString]]
                   usingParameters:parameters
                       withAccount:[GHUserActive getAccount]
               sendProgressHandler:nil
                   responseHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
                       if (error != nil) {
                           failureHandler (error);
                       }
                       else {
                           successHandler(responseData);
                       }
                   }];
}

@end
