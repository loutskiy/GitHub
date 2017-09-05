//
//  GHRepos.h
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHRequest.h"
#import "RepoModel.h"
#import "CommitModel.h"

/**
 Handler возвращаемой модели данных

 @param model Массив с объектами
 @param error NSError
 */
typedef void(^ModelHandler)(NSArray*model, NSError *error);

/**
 Хэлпер для получения массивов репо и коммитов
 */
@interface GHRepos : NSObject

/**
 Метод для получения всех репо

 @param handler ModelHandler
 */
+ (void) getAllRepos:(ModelHandler)handler;

/**
 Метод для получения коммитов для репо

 @param repoName Название репозитория
 @param ownerName Имя создателя репозитория
 @param handler ModelHandler
 */
+ (void) getAllCommitsForRepo:(NSString*)repoName withOwner:(NSString*)ownerName andGetModelHandler:(ModelHandler)handler;

@end
