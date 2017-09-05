//
//  UserModel.h
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface UserModel : JSONModel

@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *login;
@property (nonatomic) NSString *avatar_url;

@end
