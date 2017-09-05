//
//  GHManager.h
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHUserActive.h"
#import "GHRequest.h"

/**
 Состояния для делегата

 - GHAuthSuccess: Есть авторизация
 - GHLogoutSuccess: Нет авторизации
 */
typedef NS_ENUM(NSInteger, GHAuthState) {
    GHAuthSuccess = 1,
    GHLogoutSuccess
};

/**
 Делегат менеджера. С помощью него сообщаем об изменении состоянии авторизации, посылаем запрос на закрытие ViewController, посылаем запрос на показ AlertView
 */
@protocol GHManagerDelegate

/**
 Метод для работы с состоянием авторизации

 @param authState GHAuthState
 */
- (void) didGetAuthState:(GHAuthState) authState;

/**
 Метод для закрытия ViewController.
 */
- (void) didDissmissViewController;

/**
 Метод для отображения Alert

 @param text Текст ошибки
 */
- (void) didShowAlertViewControllerWithText:(NSString*)text;

@end


/**
 Класс GHManager.
 @description Входная точка
 */
@interface GHManager : NSObject

/**
 Делегат
 */
@property (nonatomic, assign) id<GHManagerDelegate> delegate;

/**
 Method for create singltone class

 @return Активный GHManager
 */
+ (instancetype)sharedManager;

/**
 Запрос авторизации
 */
+ (void)requestAuthorization;

/**
 Инициализатор сессии. Подписывается на уведомления Oauth 2.

 @return GHManager
 */
- (instancetype)initWithStartSession;

/**
 Проверка авторизации
 */
- (void)checkAuthorization;

@end
