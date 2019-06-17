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
        _subView5.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_subView5];
    }
    
    return self;
}


- (void)layoutSubviews {
    
    NSLog(@"-----%s", __FUNCTION__);
    
    [super layoutSubviews];
    
    CGFloat margin = 20.0;
    CGFloat padding = 20.0;
    CGFloat width = (self.bounds.size.width - margin * 2 - padding) / 2;
    CGFloat height = (self.bounds.size.height - margin * 2 - padding) / 2;
    
    _subView1.frame = CGRectMake(margin, margin, width, height);
    _subView2.frame = CGRectMake(margin + width + padding, margin, width, height);
    _subView3.frame = CGRectMake(margin, margin + height + padding, width, height);
    _subView4.frame = CGRectMake(margin + width + padding, margin + height + padding, width, height);
    
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_subView5 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_subView5 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200.0];
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_subView5 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:.0];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:_subView5 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:.0];
    
     [self addConstraints:@[widthConstraint, heightConstraint, centerXConstraint, centerYConstraint]];}


@end
