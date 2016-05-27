//
//  ViewController.m
//  littleman
//
//  Created by Shuwei on 16/5/17.
//  Copyright © 2016年 jov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIView *topView,*content,*other;
    CGFloat width,avgWidth,avgHeight;
    NSInteger tag;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"小小军团";
    width = self.view.frame.size.width;
    avgWidth = width/3;
    avgHeight = 90;
    CGFloat offset=64;
    self.view.backgroundColor=[Common colorWithHexString:@"e0e0e0"];
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, offset, width, 240)];
    topView.backgroundColor=[Common colorWithHexString:@"262626"];
    [self.view addSubview:topView];
    offset+=260;
    content = [[UIView alloc] initWithFrame:CGRectMake(0, offset, width, 200)];
    content.backgroundColor=[UIColor whiteColor];
    //[self.view addSubview:content];
    //offset+=220;
    other= [[UIView alloc] initWithFrame:CGRectMake(0, offset, width, 44)];
    other.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:other];
    // 3---1
    tag=1;
    UIView *b0 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, avgWidth, 110)];
    UIImageView *i0 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i0.image = [UIImage imageNamed:@"lo1.png"];
    i0.layer.masksToBounds=YES;
//    i0.layer.cornerRadius=30.0f;
//    i0.layer.borderColor=[UIColor whiteColor].CGColor;
//    i0.layer.borderWidth=1.0f;
    UILabel *l0 = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, avgWidth, 20)];
    l0.font=[UIFont systemFontOfSize:17];
    l0.textColor=[UIColor whiteColor];
    l0.textAlignment=NSTextAlignmentCenter;
    l0.text=@"基础资料";
    [b0 addSubview:i0];
    [b0 addSubview:l0];
    b0.tag=tag++;
    UITapGestureRecognizer *tap0 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap0.cancelsTouchesInView=NO;
    tap0.delegate = self;
    [b0 addGestureRecognizer:tap0];
    [topView addSubview:b0];
    
    // 3---2
    UIView *b1 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth, 10, avgWidth, 110)];
    UIImageView *i1 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i1.image = [UIImage imageNamed:@"lo2.png"];
    i1.layer.masksToBounds=YES;
//    i1.layer.cornerRadius=30.0f;
//    i1.layer.borderColor=[UIColor whiteColor].CGColor;
//    i1.layer.borderWidth=1.0f;
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, avgWidth, 20)];
    l1.font=[UIFont systemFontOfSize:17 ];
    l1.textColor=[UIColor whiteColor];
    l1.textAlignment=NSTextAlignmentCenter;
    l1.text=@"英雄图鉴";
    [b1 addSubview:i1];
    [b1 addSubview:l1];
    b1.tag=tag++;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap1.cancelsTouchesInView=NO;
    tap1.delegate = self;
    [b1 addGestureRecognizer:tap1];
    [topView addSubview:b1];
    
    // 3---3
    UIView *b2 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth*2, 10, avgWidth, 110)];
    UIImageView *i2 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i2.image = [UIImage imageNamed:@"lo3.png"];
    i2.layer.masksToBounds=YES;
//    i2.layer.cornerRadius=30.0f;
//    i2.layer.borderColor=[UIColor whiteColor].CGColor;
//    i2.layer.borderWidth=1.0f;
    UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, avgWidth, 20)];
    l2.font=[UIFont systemFontOfSize:17 ];
    l2.textColor=[UIColor whiteColor];
    l2.textAlignment=NSTextAlignmentCenter;
    l2.text=@"兵种图鉴";
    [b2 addSubview:i2];
    [b2 addSubview:l2];
    b2.tag=tag++;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap2.cancelsTouchesInView=NO;
    tap2.delegate = self;
    [b2 addGestureRecognizer:tap2];
    [topView addSubview:b2];
    
    UIView *b10 = [[UIView alloc] initWithFrame:CGRectMake(0, 130, avgWidth, 90)];
    UIImageView *i10 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i10.image = [UIImage imageNamed:@"lo4.png"];
    UILabel *l10 = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, avgWidth, 20)];
    l10.font=[UIFont systemFontOfSize:16];
    l10.textColor=[UIColor whiteColor];
    l10.textAlignment=NSTextAlignmentCenter;
    l10.text=@"装备图鉴";
    [b10 addSubview:i10];
    [b10 addSubview:l10];
    b10.tag=tag++;
    UITapGestureRecognizer *tap10 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap10.cancelsTouchesInView=NO;
    tap10.delegate = self;
    [b10 addGestureRecognizer:tap10];
    [topView addSubview:b10];
    
    UIView *b11 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth, 130, avgWidth, 90)];
    UIImageView *i11 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i11.image = [UIImage imageNamed:@"lo5.png"];
    UILabel *l11 = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, avgWidth, 20)];
    l11.font=[UIFont systemFontOfSize:16 ];
    l11.textColor=[UIColor whiteColor];
    l11.textAlignment=NSTextAlignmentCenter;
    l11.text=@"套装全揽";
    [b11 addSubview:i11];
    [b11 addSubview:l11];
    b11.tag=tag++;
    UITapGestureRecognizer *tap11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap11.cancelsTouchesInView=NO;
    tap11.delegate = self;
    [b11 addGestureRecognizer:tap11];
    [topView addSubview:b11];
    
    UIView *b12 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth*2, 130, avgWidth, 90)];
    UIImageView *i12 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i12.image = [UIImage imageNamed:@"lo6.png"];
    UILabel *l12 = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, avgWidth, 20)];
    l12.font=[UIFont systemFontOfSize:16 ];
    l12.textColor=[UIColor whiteColor];
    l12.textAlignment=NSTextAlignmentCenter;
    l12.text=@"攻略大全";
    [b12 addSubview:i12];
    [b12 addSubview:l12];
    b12.tag=tag++;
    UITapGestureRecognizer *tap12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap12.cancelsTouchesInView=NO;
    tap12.delegate = self;
    [b12 addGestureRecognizer:tap12];
    [topView addSubview:b12];
    
    UIView *b20 = [[UIView alloc] initWithFrame:CGRectMake(0, 5+avgHeight, avgWidth, 90)];
    UIImageView *i20 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i20.image = [UIImage imageNamed:@"newer.png"];
    UILabel *l20 = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, avgWidth, 20)];
    l20.font=[UIFont systemFontOfSize:16];
    l20.textColor=[UIColor blackColor];
    l20.textAlignment=NSTextAlignmentCenter;
    l20.text=@"新手指南";
    [b20 addSubview:i20];
    [b20 addSubview:l20];
    b20.tag=tag++;
    UITapGestureRecognizer *tap20 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap20.cancelsTouchesInView=NO;
    tap20.delegate = self;
    [b20 addGestureRecognizer:tap20];
    [content addSubview:b20];
    
    UIView *b21 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth, 5+avgHeight, avgWidth, 90)];
    UIImageView *i21 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i21.image = [UIImage imageNamed:@"gamer.png"];
    UILabel *l21 = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, avgWidth, 20)];
    l21.font=[UIFont systemFontOfSize:16 ];
    l21.textColor=[UIColor whiteColor];
    l21.textAlignment=NSTextAlignmentCenter;
    l21.text=@"主播推荐";
    [b21 addSubview:i21];
    [b21 addSubview:l21];
    b21.tag=tag++;
    UITapGestureRecognizer *tap21 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap21.cancelsTouchesInView=NO;
    tap21.delegate = self;
    [b21 addGestureRecognizer:tap21];
    [content addSubview:b21];
    
    UIView *b22 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth*2, 5+avgHeight, avgWidth, 90)];
    UIImageView *i22 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i22.image = [UIImage imageNamed:@"more_game.png"];
    UILabel *l22 = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, avgWidth, 20)];
    l22.font=[UIFont systemFontOfSize:16 ];
    l22.textColor=[UIColor blackColor];
    l22.textAlignment=NSTextAlignmentCenter;
    l22.text=@"游戏推荐";
    [b22 addSubview:i22];
    [b22 addSubview:l22];
    b22.tag=tag++;
    UITapGestureRecognizer *tap22 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap22.cancelsTouchesInView=NO;
    tap22.delegate = self;
    [b22 addGestureRecognizer:tap22];
    [content addSubview:b22];
    
    NSString *temp=@"更新计划" ;
    CGSize size=[temp sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont fontWithName:@"Arial" size:14.0f] forKey:NSFontAttributeName]];
    CGFloat x = avgWidth - size.width-30;
    UIView *other0 = [[UIView alloc] initWithFrame:CGRectMake(0, 2, width/2, 40)];
    UIImageView *otherimage0 = [[UIImageView alloc] initWithFrame:CGRectMake(x/2, 10, 20, 20)];
    otherimage0.image = [UIImage imageNamed:@"update"];
    UILabel *otherlabel0 = [[UILabel alloc] initWithFrame:CGRectMake(x/2+25, 10, size.width+5, 20)];
    otherlabel0.font=[UIFont systemFontOfSize:14];
    otherlabel0.textColor=[UIColor blackColor];
    //otherlabel0.textAlignment=NSTextAlignmentCenter;
    otherlabel0.text=temp;
    [other0 addSubview:otherimage0];
    [other0 addSubview:otherlabel0];
    other0.tag=tag++;
    
    UITapGestureRecognizer *tap9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap9.cancelsTouchesInView=NO;
    tap9.delegate = self;
    [other0 addGestureRecognizer:tap9];
    //[other addSubview:other0];
    
    temp = @"给我留言吧，亲";
    size =[temp sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont fontWithName:@"Arial" size:14.0f] forKey:NSFontAttributeName]];
    x = avgWidth - size.width- 30;
    UIView *other1 = [[UIView alloc] initWithFrame:CGRectMake(5, 2, width-10, 40)];
    UIImageView *otherimage1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 20, 20)];
    otherimage1.image = [UIImage imageNamed:@"message"];
    UILabel *otherlabel1 = [[UILabel alloc] initWithFrame:CGRectMake(25, 10, width-40, 20)];
    otherlabel1.font=[UIFont systemFontOfSize:14];
    otherlabel1.textColor=[UIColor blackColor];
    otherlabel1.text=@"给我留言吧，亲";
    //otherlabel1.textAlignment=NSTextAlignmentCenter;
    [other1 addSubview:otherimage1];
    [other1 addSubview:otherlabel1];
    other1.tag=tag++;
    UITapGestureRecognizer *tap8 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap8.cancelsTouchesInView=NO;
    tap8.delegate = self;
    [other1 addGestureRecognizer:tap8];
    [other addSubview:other1];
    
   
}



-(void)handler :(UITapGestureRecognizer *)sender{
    NSLog(@"tag=%ld",sender.view.tag);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    backItem.tintColor=[UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
    switch (sender.view.tag) {
        case 1:{
            BaseViewController *show = [[BaseViewController alloc] init];
            
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 2:{
            HerosViewController *show = [[HerosViewController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 3:{
            WebController *show = [[WebController alloc] init];
            [ShareData shareInstance].html=@"soliders";
            [ShareData shareInstance].urltype=nil;
            show.title=@"兵种图鉴";
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 4:{
            ToolsViewController *show = [[ToolsViewController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 5:{
            OtherViewController *show = [[OtherViewController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 6:{
            BlogsViewController *show = [[BlogsViewController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 7:{
            
        }
        case 8:{
           
        }
        case 9:{
            
        }
        case 10:{
            
        }
        case 11:{
            MessageViewController *show =[[MessageViewController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
