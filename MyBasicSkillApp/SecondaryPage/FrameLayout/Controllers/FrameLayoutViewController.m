//
//  FrameLayoutViewController.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/16.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "FrameLayoutViewController.h"
#import "MBSFrameContentView.h"

@interface FrameLayoutViewController ()

@property (nonatomic, strong) MBSFrameContentView *mbsFrameContentView;

@end

@implementation FrameLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Frame Layout Demo";
    
    _mbsFrameContentView = [[MBSFrameContentView alloc] initWithFrame:CGRectZero];
    _mbsFrameContentView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_mbsFrameContentView];
}

- (void)viewWillLayoutSubviews {
    
    NSLog(@"FrameLayoutViewController-----%s", __FUNCTION__);
    //早于 ContentView 中的 layoutSubviews 方法调用
    
    [super viewWillLayoutSubviews];
    
    _mbsFrameContentView.frame = self.view.bounds;
}


@end
