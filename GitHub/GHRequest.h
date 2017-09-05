//
//  GHRequest.h
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Handler в случае успеха

 @param responseObject NSData с ответом сервера
 */
typedef void (^GHRequestSuccessHandler)(id responseObject);

/**
 Handler в случае ошибки

 @param error NSError
 */
typedef void (^GHRequestErrorHandler) (NSError *error);

@interface GHRequest : NSObject

/**
 POST запрос

 @param urlString pathUrl без домена
 @param parameters Словарь с параметрами
 @param successHandler GHRequestSuccessHandler
 @param failureHandler GHRequestErrorHandler
 */
+ (void)POST:(NSString*)urlString withParameters:(NSDictionary*)parameters onSuccess:(GHRequestSuccessHandler) successHandler onFailure:(GHRequestErrorHandler) failureHandler;

/**
 GET запрос

 @param urlString pathUrl без домена
 @param parameters Словарь с параметрами
 @param successHandler GHRequestSuccessHandler
 @param failureHandler GHRequestErrorHandler
 */
+ (void)GET:(NSString*)urlString withParameters:(NSDictionary*)parameters onSuccess:(GHRequestSuccessHandler) successHandler onFailure:(GHRequestErrorHandler) failureHandler;

@end
