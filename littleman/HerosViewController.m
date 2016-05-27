//
//  HerosViewController.m
//  littleman
//
//  Created by Shuwei on 16/5/18.
//  Copyright © 2016年 jov. All rights reserved.
//

#import "HerosViewController.h"

@interface HerosViewController ()

@end

@implementation HerosViewController{
    MBProgressHUD *hud;
    NSMutableArray *list;
    DBHelper *db;
    CGFloat width;
    BOOL flag;
    UISearchController *searchController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:hud];
    hud.labelText = @"加载中...";
    [hud show:YES];
    db = [DBHelper sharedInstance];
    self.title=@"英雄图鉴";
    list = [[NSMutableArray alloc] init];
    width = [UIScreen mainScreen].applicationFrame.size.width-55;
    self.tableView.tableFooterView=[[UIView alloc] init];
    searchController= [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.searchResultsUpdater = self;
    searchController.dimsBackgroundDuringPresentation = YES;
    searchController.hidesNavigationBarDuringPresentation = NO;
    searchController.searchBar.frame = CGRectMake(searchController.searchBar.frame.origin.x,searchController.searchBar.frame.origin.y, searchController.searchBar.frame.size.width, 44.0);
    searchController.searchBar.placeholder=@"搜索";
    self.tableView.tableHeaderView = searchController.searchBar;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self load];
}
-(void)load{
    if([db openDB]){
        list = [db getHeros];
        [self.tableView reloadData];
    }
    [hud hide:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [list count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellidentifier = @"cellIdentifier";
    UITableViewCell    *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    cell.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLabel =(UILabel*)[cell viewWithTag:1];
    UIImageView *image=(UIImageView*)[cell viewWithTag:2];
    UILabel *contentLabel=(UILabel*)[cell viewWithTag:3];
    UILabel *tagLabel=(UILabel*)[cell viewWithTag:4];
    if(nameLabel==nil){
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 4, width, 22)];
        nameLabel.lineBreakMode=NSLineBreakByWordWrapping;
        nameLabel.numberOfLines=0;
        nameLabel.tag=1;
        [cell addSubview:nameLabel];
    }
    if(image==nil){
        image = [[UIImageView alloc]init];
        image.tag=2;
        [cell addSubview:image];
    }
    if(contentLabel==nil){
        contentLabel = [[UILabel alloc] init];
        contentLabel.lineBreakMode=NSLineBreakByWordWrapping;
        contentLabel.numberOfLines=0;
        contentLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        contentLabel.tag=3;
        [cell addSubview:contentLabel];
    }
    if(tagLabel==nil){
        tagLabel = [[UILabel alloc] init];
        tagLabel.lineBreakMode=NSLineBreakByWordWrapping;
        tagLabel.numberOfLines=0;
        tagLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        tagLabel.tag=4;
        
        [cell addSubview:tagLabel];
    }
    DataBean *bean = [list objectAtIndex:indexPath.row];
        
        if(bean){
            nameLabel.text = [NSString stringWithFormat:@"%@",bean.name];
            if(![Common isEmptyString:bean.img]){
                image.image = [UIImage imageNamed:bean.img];
            }
            contentLabel.frame=CGRectMake(50, 30, width, 20);
            contentLabel.text = [NSString stringWithFormat:@"生命值:%@,攻击力:%@,防御力:%@",bean.life,bean.attack,bean.defense];
            image.frame = CGRectMake(4, 19, 40, 40);
            tagLabel.frame=CGRectMake(50, 54, width, 20);
            tagLabel.text = [NSString stringWithFormat:@"星级:%@,幸运值:%@,闪避:%@",bean.star,bean.lucky,bean.dodge];
            
        }
 
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 78;
}
-(void)updateSearchResultsForSearchController:(UISearchController *)sController {
    NSString *searchString = [searchController.searchBar text];
    if(![Common isEmptyString:searchString]){
        list = [db getHerosByKey:searchString];
        [self.tableView reloadData];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    backItem.tintColor=[UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
    DataBean *bean=[list objectAtIndex:indexPath.row];
    WebController *show = [[WebController alloc] init];
    [ShareData shareInstance].html=bean.ref;
    [ShareData shareInstance].urltype=nil;
    show.title=bean.name;
    [self.navigationController pushViewController:show animated:YES];
}


@end
