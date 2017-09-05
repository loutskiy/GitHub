//
//  GHUserActive.h
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NXOAuth2Client/NXOAuth2.h>
#import "GHConst.h"

@interface GHUserActive : NSObject

/**
 Метод для получения активного id пользователя

 @return активный id пользователя
 */
+ (NSString*) getActiveUserId;

/**
 Метод для установки активного id пользователя

 @param userId активный id пользователя
 */
+ (void) setActiveUserId:(NSString*) userId;

/**
 Метод для получение состояния авторизации

 @return проверка на авторизацию
 */
+ (BOOL) isAuth;

/**
 Метод для деавторизации. Полностью очищает кэш.
 */
+ (void) makeLogout;

/**
 Метод возвращает аккаунт активного пользователя

 @return Объект аккаунта
 */
+ (NXOAuth2Account*) getAccount;

@end
