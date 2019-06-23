//
//  MBSContact.h
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/23.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBSContact : NSObject


#pragma mark 姓
@property (nonatomic,copy) NSString *firstName;
#pragma mark 名
@property (nonatomic,copy) NSString *lastName;
#pragma mark 手机号码
@property (nonatomic,copy) NSString *phoneNumber;

#pragma mark 带参数的构造函数
-(MBSContact *)initWithFirstName:(NSString *)firstName
                     andLastName:(NSString *)lastName
                  andPhoneNumber:(NSString *)phoneNumber;

#pragma mark 取得姓名
-(NSString *)getName;


#pragma mark 带参数的静态对象初始化方法
+(MBSContact *)initWithFirstName:(NSString *)firstName
                     andLastName:(NSString *)lastName
                  andPhoneNumber:(NSString *)phoneNumber;


@end

NS_ASSUME_NONNULL_END
