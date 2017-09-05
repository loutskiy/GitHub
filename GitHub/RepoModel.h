//
//  RepoModel.h
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "UserModel.h"

@protocol RepoModel;
@interface RepoModel : JSONModel

@property (nonatomic) NSUInteger id;
@property (nonatomic) NSString<Optional> *name;
@property (nonatomic) NSString<Optional> *full_name;
@property (nonatomic) NSString<Optional> *description;
@property (nonatomic) NSString<Optional> *url;
@property (nonatomic) NSString<Optional> *html_url;
@property (nonatomic) NSInteger forks_count;
@property (nonatomic) NSInteger watchers_count;
@property (nonatomic) UserModel<Optional> *owner;

@end
