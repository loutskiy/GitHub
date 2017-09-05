//
//  RepoVC.m
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import "RepoVC.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "CommitCell.h"
#import "GHRepos.h"
#import "DateConverter.h"

@interface RepoVC () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *commits;
}

@end

@implementation RepoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    [self loadCommits];
}

/**
 Метод конфигурирует вид
 */
- (void)configView {
    self.repoCommitsTableView.tableFooterView = [UIView new];
    self.repoAuthorImage.layer.cornerRadius = self.repoAuthorImage.frame.size.width / 2;
    self.repoAuthorImage.clipsToBounds = YES;
    self.userView.clipsToBounds = YES;
    self.userView.layer.cornerRadius = 5;
    self.title = _repoModel.name;
    self.repoDescription.text = _repoModel.description;
    self.repoAuthorName.text = _repoModel.owner.login;
    [self.repoAuthorImage sd_setImageWithURL:[NSURL URLWithString:_repoModel.owner.avatar_url]];
    self.repoCommitsTableView.rowHeight = UITableViewAutomaticDimension;
    self.repoCommitsTableView.estimatedRowHeight = 98;
    [self updateHeightHeaderView];
}

/**
 Метод обновляет высоту TableHeaderView
 */
- (void) updateHeightHeaderView {
    UIView *header = self.repoCommitsTableView.tableHeaderView;

    [header setNeedsLayout];
    [header layoutIfNeeded];

    CGFloat height = [header systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect frame = header.frame;

    frame.size.height = height;
    header.frame = frame;

    self.repoCommitsTableView.tableHeaderView = header;
}

/**
 Метод загружает коммиты
 */
- (void)loadCommits {
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    [GHRepos getAllCommitsForRepo:_repoModel.name withOwner:_repoModel.owner.login andGetModelHandler:^(NSArray*model, NSError*error) {
        commits = model;
        [self.repoCommitsTableView reloadData];
        [self updateHeightHeaderView];
        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return commits.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommitModel *commit = commits[indexPath.row];
    CommitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommitCell" forIndexPath:indexPath];
    cell.hashLabel.text = commit.sha;
    cell.commitLabel.text = commit.commit.message;
    cell.authorLabel.text = commit.commit.committer.name;
    DateConverter *dateCon = [DateConverter new];
    dateCon.date = commit.commit.committer.date;
    cell.dateLabel.text = [dateCon convertToDateWithDayMonthYear];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
