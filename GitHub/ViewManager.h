//
//  ViewManager.h
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewManager : NSObject

/**
 Метод возвращает активный UIViewController

 @return активный UIViewController
 */
+ (UIViewController*)topViewController;

@end
