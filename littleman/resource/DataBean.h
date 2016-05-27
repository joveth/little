//
//  DataBean.h
//  Starve
//
//  Created by Shuwei on 15/10/28.
//  Copyright © 2015年 jov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBean : NSObject

@property (nonatomic,copy) NSString *mail;
@property (nonatomic,copy) NSString *pwd;
@property (nonatomic,copy) NSString *from;
@property (nonatomic,copy) NSString *te;
@property (nonatomic,copy) NSString *ad;


@property(nonatomic,copy)NSString *sid;
@property(nonatomic,copy)NSString *img;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *locate;
@property(nonatomic,copy)NSString *attype;
@property(nonatomic,copy)NSString *keywords;

@property(nonatomic,copy)NSString *star;
@property(nonatomic,copy)NSString *defense;
@property(nonatomic,copy)NSString *lucky;
@property(nonatomic,copy)NSString *dodge;
@property(nonatomic,copy)NSString *ref;


//detail

@property(nonatomic,copy)NSString *bigImg;
@property(nonatomic,copy)NSString *life;
@property(nonatomic,copy)NSString *magic;
@property(nonatomic,copy)NSString *attack;
@property(nonatomic,copy)NSString *physical;
@property(nonatomic,copy)NSString *magicresist;
@property(nonatomic,copy)NSString *aspd;
@property(nonatomic,copy)NSString *distance;
@property(nonatomic,copy)NSString *speed;
@property(nonatomic,copy)NSString *ap;
@property(nonatomic,copy)NSString *apimg;
@property(nonatomic,copy)NSString *apinfor;
@property(nonatomic,copy)NSString *q;
@property(nonatomic,copy)NSString *qimg;
@property(nonatomic,copy)NSString *qcd;
@property(nonatomic,copy)NSString *qap;
@property(nonatomic,copy)NSString *qinfor;
@property(nonatomic,copy)NSString *w;
@property(nonatomic,copy)NSString *wimg;
@property(nonatomic,copy)NSString *wcd;
@property(nonatomic,copy)NSString *wap;
@property(nonatomic,copy)NSString *winfor;
@property(nonatomic,copy)NSString *e;
@property(nonatomic,copy)NSString *eimg;
@property(nonatomic,copy)NSString *ecd;
@property(nonatomic,copy)NSString *eap;
@property(nonatomic,copy)NSString *einfor;
@property(nonatomic,copy)NSString *r;
@property(nonatomic,copy)NSString *rimg;
@property(nonatomic,copy)NSString *rcd;
@property(nonatomic,copy)NSString *rap;
@property(nonatomic,copy)NSString *rinfor;

@property(nonatomic,copy)NSString *toolinfor;
@property(nonatomic,copy)NSString *runeinfor;
@property(nonatomic,copy)NSString *blogs;
//tool detail

@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *total;
@property(nonatomic,copy)NSString *infor;
@property(nonatomic,copy)NSString *usages;
@property(nonatomic,copy)NSString *fromids;
@property(nonatomic,copy)NSString *toids;

//rune

@property(nonatomic,copy)NSString *opt;
@property(nonatomic,copy)NSString *type;
@end
