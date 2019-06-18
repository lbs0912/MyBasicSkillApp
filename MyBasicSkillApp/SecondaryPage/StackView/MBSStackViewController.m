//
//  MBSStackViewController.m
//  MyBasicSkillApp
//
//  Created by 刘保帅 on 2019/6/17.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSStackViewController.h"

@interface MBSStackViewController ()

@end

@implementation MBSStackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupStackView];
}


- (void)setupStackView {
    
    UIView *subView1 = [[UIView alloc] initWithFrame:CGRectZero];
    subView1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.6];
    
    UIView *subView2 = [[UIView alloc] initWithFrame:CGRectZero];
    subView2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.6];
    
    UIView *subView3 = [[UIView alloc] initWithFrame:CGRectZero];
    subView3.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:.6];
    
    UIView *subView4 = [[UIView alloc] initWithFrame:CGRectZero];
    subView4.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:.6];
    
    
    // 创建StackView 1
    UIStackView *subStackView1 = [[UIStackView alloc] initWithFrame:CGRectZero];
    subStackView1.spacing = 10.0; //设置 stackView 子视图之间的间距
    subStackView1.alignment = UIStackViewAlignmentFill; //负责设置 stackView 子视图的对齐方式
    subStackView1.axis = UILayoutConstraintAxisHorizontal; //设置 stackView 排列方向 水平排列
    subStackView1.distribution = UIStackViewDistributionFillEqually; //设置 stackView 子视图的宽度或高度布局
    [subStackView1 addArrangedSubview:subView1];
    [subStackView1 addArrangedSubview:subView2];
    
    UIStackView *subStackView2 = [[UIStackView alloc] initWithFrame:CGRectZero];
    subStackView2.spacing = 10.0;
    subStackView2.alignment = UIStackViewAlignmentFill;
    subStackView2.axis = UILayoutConstraintAxisHorizontal;
    subStackView2.distribution = UIStackViewDistributionFillEqually;
    [subStackView2 addArrangedSubview:subView3];
    [subStackView2 addArrangedSubview:subView4];
    
    
    UIStackView *stackView = [[UIStackView alloc] initWithFrame:self.view.bounds];
    stackView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    stackView.spacing = 10.0;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    [stackView addArrangedSubview:subStackView1];
    [stackView addArrangedSubview:subStackView2];
    [self.view addSubview:stackView];
}


@end
