//
//  ViewController.m
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import "ViewController.h"
#import "GHManager.h"
#import "ViewManager.h"
#import "AuthVC.h"
#import "ReposVC.h"

@interface ViewController () <GHManagerDelegate> {
    GHManager *manager;
}

@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    manager = [GHManager sharedManager];
    manager.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [manager checkAuthorization];
}

- (void)didGetAuthState:(GHAuthState)authState {
    switch (authState) {
        case GHAuthSuccess:
        {
            id topVC = [ViewManager topViewController];
            if (topVC != self) {
                [topVC dismissViewControllerAnimated:NO completion:nil];
            }
            ReposVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ReposTab"];
            if (topVC != vc) [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case GHLogoutSuccess:
        {
            id topVC = [ViewManager topViewController];
            if (topVC != self) {
                [topVC dismissViewControllerAnimated:NO completion:nil];
            }
            AuthVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AuthVC"];
            if (topVC != vc) [self presentViewController:vc animated:YES completion:nil];
        }
            break;
            
    }
}

- (void)didDissmissViewController {
    [[ViewManager topViewController] dismissViewControllerAnimated:NO completion:nil];
}

- (void)didShowAlertViewControllerWithText:(NSString *)text {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Ошибка"
                                 message:text
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:nil];
    
    [alert addAction:yesButton];
    
    [[ViewManager topViewController] presentViewController:alert animated:YES completion:nil];
}

@end
