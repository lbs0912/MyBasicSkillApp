//
//  MBSConstraintView.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/16.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSConstraintView.h"


@interface MBSConstraintView ()

@property (nonatomic, strong) UIView *contentView;
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
        [self setUpUI]; //Step 0，1
        [self setUpConstraint]; //Step 2，3
        //Step 4 - 刷新约束
        [self layoutIfNeeded];
    }
    
    return self;
}




- (void) setUpUI {
  
    // Step 0 - 创建视图
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
    [self addSubview:_subView5];
    
    //Step 1 - 使用NSLayoutConstraint布局前，要先指明该视图不被Autoresizing控制，否则会出现约束冲突情况
    _subView1.translatesAutoresizingMaskIntoConstraints = NO;
    _subView2.translatesAutoresizingMaskIntoConstraints = NO;
    _subView3.translatesAutoresizingMaskIntoConstraints = NO;
    _subView4.translatesAutoresizingMaskIntoConstraints = NO;
    _subView5.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void) setUpConstraint {
    //Step 2 - 设置约束
    
    //subView1的top 距离superView的top
    NSLayoutConstraint *subView1TopToSuperViewTop = [NSLayoutConstraint constraintWithItem:_subView1
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1.0
                                                                               constant:100];
    //subView1的left 距离superView的left
    NSLayoutConstraint *subView1LeftToSuperViewLeft = [NSLayoutConstraint constraintWithItem:_subView1
                                                                              attribute:NSLayoutAttributeLeft
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self
                                                                              attribute:NSLayoutAttributeLeft
                                                                             multiplier:1.0
                                                                               constant:20];
    //subView1的right 距离subView2的left
    //注意坐标轴正负方向 若颠倒subView1 和subiew2的位置，则constant为+20
    NSLayoutConstraint *subView1RightToSubView2Left = [NSLayoutConstraint constraintWithItem:_subView1
                                                                                   attribute:NSLayoutAttributeRight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:_subView2
                                                                                   attribute:NSLayoutAttributeLeft
                                                                                  multiplier:1.0
                                                                                    constant:-20];
    //subView2的right 距离superView的right
    NSLayoutConstraint *subView2RightToSuperViewRight = [NSLayoutConstraint constraintWithItem:_subView2
                                                                                   attribute:NSLayoutAttributeRight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self
                                                                                   attribute:NSLayoutAttributeRight
                                                                                  multiplier:1.0
                                                                                    constant:-20];
    //subView2的top 和subview1的top 一致
    NSLayoutConstraint *subView2TopToSubView1Top = [NSLayoutConstraint constraintWithItem:_subView2
                                                                                     attribute:NSLayoutAttributeTop
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:_subView1
                                                                                     attribute:NSLayoutAttributeTop
                                                                                    multiplier:1.0
                                                                                      constant:0.0];
    //subView1的bottom 距离 subview3的top
    NSLayoutConstraint *subView1BottomToSubView3Top = [NSLayoutConstraint constraintWithItem:_subView1
                                                                                attribute:NSLayoutAttributeBottom
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:_subView3
                                                                                attribute:NSLayoutAttributeTop
                                                                               multiplier:1.0
                                                                                 constant:-20];
    //subView2的bottom 和subview1的bottom 一致
    NSLayoutConstraint *subView2BottomToSubView1Bottom = [NSLayoutConstraint constraintWithItem:_subView2
                                                                                   attribute:NSLayoutAttributeBottom
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:_subView1
                                                                                   attribute:NSLayoutAttributeBottom
                                                                                  multiplier:1.0
                                                                                    constant:0.0];
    //subView3的left 和subview1的left 一致
    NSLayoutConstraint *subView3LeftToSubView1Left = [NSLayoutConstraint constraintWithItem:_subView3
                                                                                      attribute:NSLayoutAttributeLeft
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:_subView1
                                                                                      attribute:NSLayoutAttributeLeft
                                                                                     multiplier:1.0
                                                                                       constant:0.0];
    
    //subView3的bottom 距离 superView 的bottom
    NSLayoutConstraint *subView3BottomToSuperViewBottom = [NSLayoutConstraint constraintWithItem:_subView3
                                                                                  attribute:NSLayoutAttributeBottom
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self
                                                                                  attribute:NSLayoutAttributeBottom
                                                                                 multiplier:1.0
                                                                                   constant:-100];
    //subView3的right 距离 subView4 的left
    NSLayoutConstraint *subView3RightToSubView4Left = [NSLayoutConstraint constraintWithItem:_subView3
                                                                                       attribute:NSLayoutAttributeRight
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:_subView4
                                                                                       attribute:NSLayoutAttributeLeft
                                                                                      multiplier:1.0
                                                                                        constant:-20];
    //subView4的right 距离 superView 的right
    NSLayoutConstraint *subView4RightToSuperViewRight = [NSLayoutConstraint constraintWithItem:_subView4
                                                                                   attribute:NSLayoutAttributeRight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self
                                                                                   attribute:NSLayoutAttributeRight
                                                                                  multiplier:1.0
                                                                                    constant:-20];
    //subView4的bottom 和subview3的bottom 一致
    NSLayoutConstraint *subView4BottomToSubView3Bottom = [NSLayoutConstraint constraintWithItem:_subView4
                                                                                     attribute:NSLayoutAttributeBottom
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:_subView3
                                                                                     attribute:NSLayoutAttributeBottom
                                                                                    multiplier:1.0
                                                                                      constant:0.0];
    
    //subView2的width 和subview1的width 一致
    NSLayoutConstraint *subView2WidthToSubView1Width = [NSLayoutConstraint constraintWithItem:_subView2
                                                                                attribute:NSLayoutAttributeWidth
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:_subView1
                                                                                attribute:NSLayoutAttributeWidth
                                                                               multiplier:1.0
                                                                                 constant:0.0];
    //subView3的width 和subview1的width 一致
    NSLayoutConstraint *subView3WidthToSubView1Width = [NSLayoutConstraint constraintWithItem:_subView3
                                                                                    attribute:NSLayoutAttributeWidth
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:_subView1
                                                                                    attribute:NSLayoutAttributeWidth
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    //subView4的width 和subview1的width 一致
    NSLayoutConstraint *subView4WidthToSubView1Width = [NSLayoutConstraint constraintWithItem:_subView4
                                                                                    attribute:NSLayoutAttributeWidth
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:_subView1
                                                                                    attribute:NSLayoutAttributeWidth
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    
    //subView2的height 和subview1的height 一致
    NSLayoutConstraint *subView2HeightToSubView1Height = [NSLayoutConstraint constraintWithItem:_subView2
                                                                                    attribute:NSLayoutAttributeHeight
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:_subView1
                                                                                    attribute:NSLayoutAttributeHeight
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    //subView3的height 和subview1的height 一致
    NSLayoutConstraint *subView3HeightToSubView1Height = [NSLayoutConstraint constraintWithItem:_subView3
                                                                                      attribute:NSLayoutAttributeHeight
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:_subView1
                                                                                      attribute:NSLayoutAttributeHeight
                                                                                     multiplier:1.0
                                                                                       constant:0.0];
    //subView4的height 和subview1的height 一致
    NSLayoutConstraint *subView4HeightToSubView1Height = [NSLayoutConstraint constraintWithItem:_subView4
                                                                                      attribute:NSLayoutAttributeHeight
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:_subView1
                                                                                      attribute:NSLayoutAttributeHeight
                                                                                     multiplier:1.0
                                                                                       constant:0.0];

    //设置约束 subview 5
    NSLayoutConstraint *subView5WidthConstraint = [NSLayoutConstraint constraintWithItem:_subView5
                                                                               attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                                                  toItem:nil
                                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                                              multiplier:1.0
                                                                                constant:100.0];
    
    NSLayoutConstraint *subView5HeightConstraint = [NSLayoutConstraint constraintWithItem:_subView5
                                                                                attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual
                                                                                   toItem:nil
                                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                                               multiplier:1.0
                                                                                 constant:200.0];
    
    NSLayoutConstraint *subView5CenterXConstraint = [NSLayoutConstraint constraintWithItem:_subView5
                                                                                  attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self
                                                                                  attribute:NSLayoutAttributeCenterX
                                                                                 multiplier:1.0
                                                                                   constant:0.0];
    
    NSLayoutConstraint *subView5CenterYConstraint = [NSLayoutConstraint constraintWithItem:_subView5
                                                                                  attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self
                                                                                  attribute:NSLayoutAttributeCenterY
                                                                                 multiplier:1.0
                                                                                   constant:0.0];
    //Step 3 - 添加约束
     [self addConstraints:@[subView1TopToSuperViewTop,
                            subView1LeftToSuperViewLeft,
                            subView1RightToSubView2Left,
                            subView2RightToSuperViewRight,
                            subView2TopToSubView1Top,
                            subView1BottomToSubView3Top,
                            subView2BottomToSubView1Bottom,
                            subView3LeftToSubView1Left,
                            subView3BottomToSuperViewBottom,
                            subView3RightToSubView4Left,
                            subView4RightToSuperViewRight,
                            subView4BottomToSubView3Bottom,
                            subView2WidthToSubView1Width,
                            subView3WidthToSubView1Width,
                            subView4WidthToSubView1Width,
                            subView2HeightToSubView1Height,
                            subView3HeightToSubView1Height,
                            subView4HeightToSubView1Height,
                            subView5WidthConstraint,
                            subView5HeightConstraint,
                            subView5CenterXConstraint,
                            subView5CenterYConstraint]];
                                                  


    
    
}



@end
