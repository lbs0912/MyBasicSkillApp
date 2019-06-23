//
//  MBSTableViewCell.h
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/23.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBSStatus;


@interface MBSTableViewCell : UITableViewCell

#pragma mark 微博对象
@property (nonatomic,strong) MBSStatus *status;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;

@end


