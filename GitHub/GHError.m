//
//  GHError.m
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import "GHError.h"
#import "GHManager.h"

@implementation GHError

+ (void)sendErrorAlertWithText:(NSString *)alertText {
    GHManager *manager = [GHManager sharedManager];
    [manager.delegate didShowAlertViewControllerWithText:alertText];
}

@end
