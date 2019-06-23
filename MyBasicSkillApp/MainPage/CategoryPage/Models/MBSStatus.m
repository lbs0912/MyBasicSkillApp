//
//  MBSStatus.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/23.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSStatus.h"

@implementation MBSStatus

#pragma mark 根据字典初始化微博对象
-(MBSStatus *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.Id=[dic[@"Id"] longLongValue];
        self.profileImageUrl=dic[@"profileImageUrl"];
        self.userName=dic[@"userName"];
        self.mbtype=dic[@"mbtype"];
        self.createdAt=dic[@"createdAt"];
        self.source=dic[@"source"];
        self.text=dic[@"text"];
    }
    return self;
}

#pragma mark 初始化微博对象（静态方法）
+(MBSStatus *)statusWithDictionary:(NSDictionary *)dic{
    MBSStatus *status=[[MBSStatus alloc]initWithDictionary:dic];
    return status;
}

-(MBSStatus *)source{
    return [NSString stringWithFormat:@"来自 %@",_source];
}


@end
