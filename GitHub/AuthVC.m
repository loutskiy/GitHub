//
//  AuthVC.m
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import "AuthVC.h"
#import "GHManager.h"

@interface AuthVC ()

@end

@implementation AuthVC

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)signInAction:(id)sender {
    [GHManager requestAuthorization];
}

@end
