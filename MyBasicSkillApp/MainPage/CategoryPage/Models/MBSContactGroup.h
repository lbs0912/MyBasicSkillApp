//
//  MBSContactGroup.h
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/23.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBSContactGroup : NSObject

#pragma mark 组名
@property (nonatomic,copy) NSString *name;

#pragma mark 分组描述
@property (nonatomic,copy) NSString *detail;

#pragma mark 联系人
@property (nonatomic,strong) NSMutableArray *contacts;

#pragma mark 带参数的构造函数
-(MBSContactGroup *)initWithName:(NSString *)name
                       andDetail:(NSString *)detail
                     andContacts:(NSMutableArray *)contacts;

#pragma mark 静态初始化方法
+(MBSContactGroup *)initWithName:(NSString *)name
                       andDetail:(NSString *)detail
                     andContacts:(NSMutableArray *)contacts;
@end

NS_ASSUME_NONNULL_END
