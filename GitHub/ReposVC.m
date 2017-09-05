//
//  ReposVC.m
//  GitHub
//
//  Created by Михаил Луцкий on 04.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import "ReposVC.h"
#import "RepoCell.h"
#import "GHRepos.h"
#import "RepoModel.h"
#import "RepoVC.h"

@interface ReposVC () {
    NSArray*models;
}

@end

@implementation ReposVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self loadData];
}

/**
 Метод загружает репозитории
 */
- (void) loadData {
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    [GHRepos getAllRepos:^(NSArray *responseModels, NSError*error) {
        models = responseModels;
        [self.tableView reloadData];
        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RepoModel *model = models[indexPath.row];
    RepoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RepoCell" forIndexPath:indexPath];
    cell.repoName.text = model.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RepoModel *model = models[indexPath.row];
    RepoVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RepoVC"];
    vc.repoModel = model;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)refreshAction:(id)sender {
    [self loadData];
}

@end
