//
//  BaseViewController.m
//  littleman
//
//  Created by Shuwei on 16/5/17.
//  Copyright © 2016年 jov. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController{
    NSArray *titles ;
    NSArray *htmls;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"基本资料";
    titles = @[@"城邦",@"任务系统",@"酒馆说明",@"兵营作用",@"宝箱说明",@"学院"];
    htmls =@[@"aboutcity",@"abouttask",@"aboutbar",@"aboutbarracks",@"aboutbox",@"aboutschool"];
    self.tableView.tableFooterView=[[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [titles count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellIdentifier";
    UITableViewCell    *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text=[titles objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    backItem.tintColor=[UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
    WebController *show = [[WebController alloc] init];
    [ShareData shareInstance].html=[htmls objectAtIndex:indexPath.row];
    [ShareData shareInstance].urltype=nil;
    show.title=[titles objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:show animated:YES];
}

@end
