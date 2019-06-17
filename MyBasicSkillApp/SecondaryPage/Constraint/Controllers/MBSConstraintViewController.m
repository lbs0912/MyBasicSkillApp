//
//  MBSConstraintViewController.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/16.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSConstraintViewController.h"
#import "MBSConstraintView.h"

@interface MBSConstraintViewController ()
@property (nonatomic, strong) MBSConstraintView *mbConstraintView;
@end

@implementation MBSConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Constraint Layout Demo";
    
    _mbConstraintView = [[MBSConstraintView alloc] initWithFrame:CGRectZero];
    _mbConstraintView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:_mbConstraintView];
    
    
    UIView *subView5 = [[UIView alloc] initWithFrame:CGRectZero];
    subView5.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:.6];
    //Step 1 - 使用NSLayoutConstraint布局前，要先指明该视图不被Autoresizing控制，否则会出现约束冲突情况
    subView5.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:subView5];
    
    
    //Step 2 - 设置约束
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:subView5 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:subView5 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200.0];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:subView5 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:.0];
    
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:subView5 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:.0];
    
       
    
     //Step 3 - 添加约束
    [self.view addConstraints:@[widthConstraint, heightConstraint, centerXConstraint, centerYConstraint]];
}



@end
