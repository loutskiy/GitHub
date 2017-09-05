//
//  CommitModel.h
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Person : JSONModel

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *date;

@end

@interface Commit : JSONModel

@property (nonatomic) NSString *message;
@property (nonatomic) Person *author;
@property (nonatomic) Person *committer;

@end

@protocol CommitModel;
@interface CommitModel : JSONModel

@property (nonatomic) NSString *sha;
@property (nonatomic) Commit *commit;

@end
