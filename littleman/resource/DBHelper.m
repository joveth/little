//
//  DBHelper.m
//  Isaac
//
//  Created by Shuwei on 15/7/2.
//  Copyright (c) 2015年 Shuwei. All rights reserved.
//

#import "DBHelper.h"
#import "FMDatabase.h"
#import "Common.h"


@interface DBHelper(){
    FMDatabase *db;
}
@end

static const NSString *TB_HEROS = @"tb_heros";
static const NSString *TB_BASE = @"tb_base";
static const NSString *TB_BLOGS = @"tb_blogs";//装备

static const NSString *TB_SETTING = @"tb_setting";


@implementation DBHelper
+(id)sharedInstance{
    static DBHelper *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedInstance = [[super alloc]init];
    });
    return sharedInstance;
}
-(BOOL)openDB{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:@"heros300.sqlite"];
    
    // 1.获得数据库对象
    db = [FMDatabase databaseWithPath:fileName];
    // 2.打开数据库
    if ([db open]) {
        NSLog(@"打开成功");
        // 2.1创建表
        NSString *sql = @"CREATE TABLE IF NOT EXISTS %@ ( name varchar(60),image varchar(80),star varchar(10), type varchar(2),life varchar(30), attack varchar(30),defense varchar(30),lucky varchar(30),dodge varchar(30),ref varchar(40) )";
        BOOL success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_HEROS]];
        
        sql = @"CREATE TABLE IF NOT EXISTS %@ (key varchar(20),version varchar(10),buildno varchar(10))";

        success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_SETTING]];
        
        sql = @"CREATE TABLE IF NOT EXISTS %@ (  name varchar(60),image varchar(80),star varchar(10), type varchar(2),life varchar(100), attack varchar(100),defense varchar(30),lucky varchar(30),dodge varchar(30),get varchar(100) )";
        
        success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_BASE]];
        
        sql = @"CREATE TABLE IF NOT EXISTS %@ (name varchar(100),type varchar(2),ref varchar(40))";
        
        success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_BLOGS]];
        
        
        return success;
    }else{
        return NO;
    }
}
-(void)initData:(BOOLCallBack)success{
    NSArray *aArray = [@"base.db" componentsSeparatedByString:@"."];
    NSString *filename = [aArray objectAtIndex:0];
    NSString *sufix = [aArray objectAtIndex:1];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:sufix];
    NSString* myString = [NSString stringWithContentsOfFile:filePath usedEncoding:NULL error:NULL];
    NSArray *result = [myString componentsSeparatedByString:@"\n"];
    if(![db open]){
        if(success){
            success(NO);
        }
        return;
    }
    for(int i=0;i<[result count];i++){
        myString = [result objectAtIndex:i];
        if([Common isEmptyString:myString]){
            continue;
        }else if([myString hasPrefix:@"#"]){
            continue;
        }
        [db executeUpdate:myString];
    }
    [db close];
    if(success){
        success(YES);
    }
}
-(void)deleteData{
    if(![db open]){
        return;
    }
    [db executeUpdate:[NSString stringWithFormat:@"delete from %@ ",TB_HEROS]];
    [db executeUpdate:[NSString stringWithFormat:@"delete from %@ ",TB_BASE]];
    [db executeUpdate:[NSString stringWithFormat:@"delete from %@ ",TB_BLOGS]];
    [db executeUpdate:[NSString stringWithFormat:@"delete from %@ ",TB_SETTING]];
   
    [db close];
}

-(NSInteger)getCnt{
    if(![db open])
    {
        return 0;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select count(*) as total from %@ ",TB_HEROS]];
    NSString *temp =@"0";
    if ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        temp = dict[@"total"];
    }
    [rs close];
    [db close];
    return temp.integerValue;
}
-(NSMutableArray *)getHerosByType:(NSString *)type{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where type=? ",TB_HEROS],type];
    DataBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[DataBean alloc] init];
        bean.img = dict[@"image"];
        bean.name = dict[@"name"];
        bean.star = dict[@"star"];
        bean.type = dict[@"type"];
        bean.life = dict[@"life"];
        bean.attack = dict[@"attack"];
        bean.defense = dict[@"defense"];
        bean.lucky = dict[@"lucky"];
        bean.dodge = dict[@"dodge"];
        bean.ref = dict[@"ref"];
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getHeros{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  ",TB_HEROS]];
    DataBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[DataBean alloc] init];
       
        bean.img = dict[@"image"];
        bean.name = dict[@"name"];
        bean.star = dict[@"star"];
        bean.type = dict[@"type"];
        bean.life = dict[@"life"];
        bean.attack = dict[@"attack"];
        bean.defense = dict[@"defense"];
        bean.lucky = dict[@"lucky"];
        bean.dodge = dict[@"dodge"];
        bean.ref = dict[@"ref"];
        
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}

-(NSMutableArray *)getHerosByKey:(NSString *)key;{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where  name like '%%%@%%'  ",TB_HEROS,key]];
    DataBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[DataBean alloc] init];
        bean.img = dict[@"image"];
        bean.name = dict[@"name"];
        bean.star = dict[@"star"];
        bean.type = dict[@"type"];
        bean.life = dict[@"life"];
        bean.attack = dict[@"attack"];
        bean.defense = dict[@"defense"];
        bean.lucky = dict[@"lucky"];
        bean.dodge = dict[@"dodge"];
        bean.ref = dict[@"ref"];
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}

-(NSMutableArray *)getBase{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  ",TB_BASE]];
    DataBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[DataBean alloc] init];
        
        bean.img = dict[@"image"];
        bean.name = dict[@"name"];
        bean.star = dict[@"star"];
        bean.type = dict[@"type"];
        bean.life = dict[@"life"];
        bean.attack = dict[@"attack"];
        bean.defense = dict[@"defense"];
        bean.lucky = dict[@"lucky"];
        bean.dodge = dict[@"dodge"];
        bean.ref = dict[@"get"];
        
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getBaseByType:(NSString *)type{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where type=? ",TB_BASE],type];
    DataBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[DataBean alloc] init];
        bean.img = dict[@"image"];
        bean.name = dict[@"name"];
        bean.star = dict[@"star"];
        bean.type = dict[@"type"];
        bean.life = dict[@"life"];
        bean.attack = dict[@"attack"];
        bean.defense = dict[@"defense"];
        bean.lucky = dict[@"lucky"];
        bean.dodge = dict[@"dodge"];
        bean.ref = dict[@"get"];
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
    
}
-(NSMutableArray *)getBaseByKey:(NSString *)key{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where  name like '%%%@%%'  ",TB_BASE,key]];
    DataBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[DataBean alloc] init];
        bean.img = dict[@"image"];
        bean.name = dict[@"name"];
        bean.star = dict[@"star"];
        bean.type = dict[@"type"];
        bean.life = dict[@"life"];
        bean.attack = dict[@"attack"];
        bean.defense = dict[@"defense"];
        bean.lucky = dict[@"lucky"];
        bean.dodge = dict[@"dodge"];
        bean.ref = dict[@"get"];
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getBlogs{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  ",TB_BLOGS]];
    DataBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[DataBean alloc] init];
        bean.name = dict[@"name"];
        bean.type = dict[@"type"];
        bean.ref = dict[@"ref"];
        
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;

}

-(SettingBean *)getSetting:(NSString *)key{
    
    if(![db open])
    {
        return nil;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where key=? ",TB_SETTING],key];
    SettingBean *bean;
    if ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[SettingBean alloc] init];
        bean.key = dict[@"key"];
        bean.version = dict[@"version"];
        bean.buildno = dict[@"buildno"];
    }
    [rs close];
    [db close];
    return bean;
}
-(void)saveSetting:(SettingBean *)setting{
    if(![db open]){
        return;
    }
    [db executeUpdate:[NSString stringWithFormat:@"insert into %@(key,version,buildno) values(?,?,?) ",TB_SETTING],setting.key,setting.version,setting.buildno];
    [db close];
}
-(void)deleteSetting{
    if(![db open]){
        return;
    }
    [db executeUpdate:[NSString stringWithFormat:@"delete from %@ ",TB_SETTING]];
    [db close];
}


@end
