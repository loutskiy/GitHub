//
//  GHRepos.m
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import "GHRepos.h"
#import "GHConst.h"
#import "GHError.h"

@implementation GHRepos

+ (void) getAllRepos:(ModelHandler)handler {
    [GHRequest GET:@"user/repos" withParameters:nil onSuccess:^(id responseObject) {
        NSError *error;
        NSArray* repoModel = [RepoModel arrayOfModelsFromData:responseObject error:&error];
        handler(repoModel, error);
    } onFailure:^(NSError*error) {
        handler(nil, error);
        [GHError sendErrorAlertWithText:error.localizedDescription];
    }];
}

+ (void)getAllCommitsForRepo:(NSString *)repoName withOwner:(NSString *)ownerName andGetModelHandler:(ModelHandler)handler {
    NSString *pathUrl = [NSString stringWithFormat:@"repos/%@/%@/commits", ownerName, repoName];
    NSLog(@"%@%@",kAPI,pathUrl);
    [GHRequest GET:pathUrl withParameters:nil onSuccess:^(id responseObject) {
        NSError *error;
        NSArray* commitModel = [CommitModel arrayOfModelsFromData:responseObject error:&error];
        handler(commitModel, error);
    } onFailure:^(NSError *error) {
        handler(nil, error);
        [GHError sendErrorAlertWithText:error.localizedDescription];
    }];
}

@end
