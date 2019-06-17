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
    [self.view addSubview:_mbConstraintView];
}


- (void)viewWillLayoutSubviews {
    
    NSLog(@"-----%s", __FUNCTION__);
    //早于 ContentView 中的 layoutSubviews 方法调用
    
    [super viewWillLayoutSubviews];
    
    _mbConstraintView.frame = self.view.bounds;
}


@end
