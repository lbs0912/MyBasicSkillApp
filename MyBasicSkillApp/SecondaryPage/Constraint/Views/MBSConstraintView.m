//
//  MBSConstraintView.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/16.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSConstraintView.h"


@interface MBSConstraintView ()

@property (nonatomic, strong) UIView *subView1;
@property (nonatomic, strong) UIView *subView2;
@property (nonatomic, strong) UIView *subView3;
@property (nonatomic, strong) UIView *subView4;
@property (nonatomic, strong) UIView *subView5;

@end


@implementation MBSConstraintView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setUpUI];
        [self setUpConstraint];
    }
    
    return self;
}




- (void) setUpUI {
    _subView1 = [[UIView alloc] initWithFrame:CGRectZero];
    _subView1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.6];
    [self addSubview:_subView1];
    
    _subView2 = [[UIView alloc] initWithFrame:CGRectZero];
    _subView2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.6];
    [self addSubview:_subView2];
    
    _subView3 = [[UIView alloc] initWithFrame:CGRectZero];
    _subView3.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:.6];
    [self addSubview:_subView3];
    
    _subView4 = [[UIView alloc] initWithFrame:CGRectZero];
    _subView4.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:.6];
    [self addSubview:_subView4];
    
    _subView5 = [[UIView alloc] initWithFrame:CGRectZero];
    _subView5.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:.6];

    //Step 1 - 使用NSLayoutConstraint布局前，要先指明该视图不被Autoresizing控制，否则会出现约束冲突情况
    _subView5.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_subView5];
}

- (void) setUpConstraint {
   

    
    
    //设置约束
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_subView5 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_subView5 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200.0];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_subView5 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:.0];
    
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:_subView5 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:.0];
    
    
    
    //Step 3 - 添加约束
    [self addConstraints:@[widthConstraint, heightConstraint, centerXConstraint, centerYConstraint]];
}



@end
