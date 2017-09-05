//
//  AuthVC.h
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthVC : UIViewController

/**
 Метод срабатывает при нажатии копку Войти и служит для открытия браузера с Oauth авторизацией

 @param sender Кнопка
 */
- (IBAction)signInAction:(id)sender;

@end
