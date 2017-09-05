//
//  ReposVC.h
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface ReposVC : UITableViewController

/**
 Метод срабатывает при нажатии кнопки Обновить и служит для повторного запроса списка репо

 @param sender Кнопка
 */
- (IBAction)refreshAction:(id)sender;

@end
