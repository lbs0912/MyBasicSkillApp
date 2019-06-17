//
//  AutoresizingViewController.m
//  MyBasicSkillApp
//
//  Created by 刘保帅 on 2019/6/17.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "AutoresizingViewController.h"
#import "MBSAutoresizingView.h"

@interface AutoresizingViewController ()
@property (nonatomic, strong) MBSAutoresizingView *mbsAutoresizingView;
@end

@implementation AutoresizingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Autoresizing Layout Demo";
    
    _mbsAutoresizingView = [[MBSAutoresizingView alloc] initWithFrame:CGRectZero];
    _mbsAutoresizingView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_mbsAutoresizingView];
    
}

- (void)viewWillLayoutSubviews {
    
    NSLog(@"FrameLayoutViewController-----%s", __FUNCTION__);
    //早于 ContentView 中的 layoutSubviews 方法调用
    
    [super viewWillLayoutSubviews];
    
    _mbsAutoresizingView.frame = self.view.bounds;
}



@end
