//
//  GHError.h
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Хэлпер для обработки ошибок
 */
@interface GHError : NSObject

/**
 Метод обращается к делегату в GHManager и посылает сообщение об ошибке

 @param alertText Сообщение об ошибке
 */
+ (void) sendErrorAlertWithText:(NSString*)alertText;

@end
