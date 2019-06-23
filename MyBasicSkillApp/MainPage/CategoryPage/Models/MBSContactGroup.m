//
//  MBSContactGroup.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/23.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSContactGroup.h"

@implementation MBSContactGroup

-(MBSContactGroup *)initWithName:(NSString *)name
                       andDetail:(NSString *)detail
                     andContacts:(NSMutableArray *)contacts
{
    if (self=[super init]) {
        self.name=name;
        self.detail=detail;
        self.contacts=contacts;
    }
    return self;
}

+(MBSContactGroup *)initWithName:(NSString *)name
                       andDetail:(NSString *)detail
                     andContacts:(NSMutableArray *)contacts
{
    MBSContactGroup *group1=[[MBSContactGroup alloc]initWithName:name
                                                       andDetail:detail
                                                     andContacts:contacts];
    return group1;
}



@end
