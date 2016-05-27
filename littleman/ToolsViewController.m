//
//  ToolsViewController.m
//  littleman
//
//  Created by Shuwei on 16/5/18.
//  Copyright © 2016年 jov. All rights reserved.
//

#import "ToolsViewController.h"

@interface ToolsViewController ()

@end

@implementation ToolsViewController{
    MBProgressHUD *hud;
    NSMutableArray *list0,*list1,*list2,*list3,*list4,*list5,*list6,*list7;
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
    self.title=@"装备图鉴";
    list0 = [[NSMutableArray alloc] init];
    list1 = [[NSMutableArray alloc] init];
    list2 = [[NSMutableArray alloc] init];
    list3 = [[NSMutableArray alloc] init];
    list4 = [[NSMutableArray alloc] init];
    list5 = [[NSMutableArray alloc] init];
    list6 = [[NSMutableArray alloc] init];
    list7 = [[NSMutableArray alloc] init];
    
    
    width = [UIScreen mainScreen].applicationFrame.size.width-55;
    self.tableView.tableFooterView=[[UIView alloc] init];
    
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
        list0 = [db getBaseByType:@"0"];
        list1 = [db getBaseByType:@"1"];
        list2 = [db getBaseByType:@"2"];
        list3 = [db getBaseByType:@"3"];
        list4 = [db getBaseByType:@"4"];
        list5 = [db getBaseByType:@"5"];
        list6 = [db getBaseByType:@"6"];
        list7 = [db getBaseByType:@"7"];
        [self.tableView reloadData];
    }
    [hud hide:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0){
        return [list0 count];
    }else if(section==1){
        return [list1 count];
    }else if(section==2){
        return [list2 count];
    }else if(section==3){
        return [list3 count];
    }else if(section==4){
        return [list4 count];
    }else if(section==5){
        return [list5 count];
    }else if(section==6){
        return [list6 count];
    }else if(section==7){
        return [list7 count];
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = @"";
    if(section==0){
        sectionTitle=@"武器";
    }else if(section==1){
        sectionTitle=@"头盔";
    }else if(section==2){
        sectionTitle=@"防具";
    }else if(section==3){
        sectionTitle=@"鞋子";
    }else if(section==4){
        sectionTitle=@"戒子";
    }else if(section==5){
        sectionTitle=@"攻击饰品";
    }else if(section==6){
        sectionTitle=@"防御饰品";
    }else if(section==7){
        sectionTitle=@"生命饰品";
    }
    
    
    UILabel * label = [[UILabel alloc] init];
    label.frame = CGRectMake(2, 0, 320, 22);
    
    label.font=[UIFont fontWithName:@"Arial" size:14];
    label.text = sectionTitle;
    
    UIView * sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)] ;
    sectionView.backgroundColor=[Common colorWithHexString:@"e0e0e0"];
    [sectionView addSubview:label];
    return sectionView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 22;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellidentifier = @"cellIdentifier";
    UITableViewCell    *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    cell.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLabel =(UILabel*)[cell viewWithTag:1];
    UIImageView *image=(UIImageView*)[cell viewWithTag:2];
    UILabel *contentLabel=(UILabel*)[cell viewWithTag:3];
    UILabel *tagLabel=(UILabel*)[cell viewWithTag:4];
    UILabel *getLabel=(UILabel*)[cell viewWithTag:5];
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
    if(getLabel==nil){
        getLabel = [[UILabel alloc] init];
        getLabel.lineBreakMode=NSLineBreakByWordWrapping;
        getLabel.numberOfLines=0;
        getLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        getLabel.tag=5;
        
        [cell addSubview:tagLabel];
    }
    DataBean *bean ;
    if(indexPath.section==0){
        bean = [list0 objectAtIndex:indexPath.row];
    }else if(indexPath.section==1){
        bean = [list1 objectAtIndex:indexPath.row];
    }else if(indexPath.section==2){
        bean = [list2 objectAtIndex:indexPath.row];
    }else if(indexPath.section==3){
        bean = [list3 objectAtIndex:indexPath.row];
    }else if(indexPath.section==4){
        bean = [list4 objectAtIndex:indexPath.row];
    }else if(indexPath.section==5){
        bean = [list5 objectAtIndex:indexPath.row];
    }else if(indexPath.section==6){
        bean = [list6 objectAtIndex:indexPath.row];
    }else if(indexPath.section==7){
        bean = [list7 objectAtIndex:indexPath.row];
    }
    if(bean){
        nameLabel.text = [NSString stringWithFormat:@"%@",bean.name];
        if(![Common isEmptyString:bean.img]){
            image.image = [UIImage imageNamed:bean.img];
        }
        image.frame = CGRectMake(4, 31, 40, 40);
        
        contentLabel.frame=CGRectMake(50, 30, width, 20);
        tagLabel.frame=CGRectMake(50, 54, width, 20);
        getLabel.frame=CGRectMake(50, 78, width, 20);
        getLabel.text=[NSString stringWithFormat:@"获得:%@",bean.ref];
        if(indexPath.section>4){
            contentLabel.text = [NSString stringWithFormat:@"性能:%@,星级:%@",bean.life,bean.star];
            tagLabel.text = [NSString stringWithFormat:@"特殊效果:%@",bean.attack];
        }else{
            contentLabel.text = [NSString stringWithFormat:@"生命值:%@,攻击力:%@,防御力:%@",bean.life,bean.attack,bean.defense];
            tagLabel.text = [NSString stringWithFormat:@"星级:%@,幸运值:%@,闪避:%@",bean.star,bean.lucky,bean.dodge];

        }
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 102;
}


@end
