//
//  CommitCell.h
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommitCell : UITableViewCell

/**
 Хэщ коммита
 */
@property (weak, nonatomic) IBOutlet UILabel *hashLabel;

/**
 Текст коммита
 */
@property (weak, nonatomic) IBOutlet UILabel *commitLabel;

/**
 Имя автора коммита
 */
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

/**
 Дата коммита
 */
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
