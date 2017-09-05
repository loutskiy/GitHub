//
//  RepoVC.h
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepoModel.h"

@interface RepoVC : UIViewController

/**
 Описание репозитория
 */
@property (weak, nonatomic) IBOutlet UILabel *repoDescription;

/**
 Аватарка владельца репозитория
 */
@property (weak, nonatomic) IBOutlet UIImageView *repoAuthorImage;

/**
 Имя владельца репозитория
 */
@property (weak, nonatomic) IBOutlet UILabel *repoAuthorName;

/**
 Таблица с коммитами
 */
@property (weak, nonatomic) IBOutlet UITableView *repoCommitsTableView;

/**
 Та серая подложка под именем пользователя
 */
@property (weak, nonatomic) IBOutlet UIView *userView;

/**
 Модель данных репозитория
 */
@property (nonatomic, copy) RepoModel *repoModel;

@end
