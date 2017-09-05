//
//  RepoCell.h
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepoCell : UITableViewCell

/**
 Название репозитория
 */
@property (weak, nonatomic) IBOutlet UILabel *repoName;

@end
