//
//  MBSHomeViewController.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/16.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSHomeViewController.h"
#import "FrameLayoutViewController.h"
#import "MBSMasonryViewController.h"
#import "MBSConstraintViewController.h"
#import "AutoresizingViewController.h"

@interface MBSHomeViewController ()

@end

@implementation MBSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}


#pragma mark - setUpUI
- (void) setUpUI {
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect screen = [[UIScreen mainScreen] bounds];
    /// 1.添加Frame 布局按钮
    UIButton *frameBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    frameBtn.frame  = CGRectMake((screen.size.width - 180)/2, 120, 180, 30);
    [frameBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    frameBtn.tag = 1;
    [frameBtn setTitle:@"Frame Layout Demo" forState:UIControlStateNormal];
    [frameBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:frameBtn];
    
    /// 2.添加Autoresizing 布局按钮
    UIButton *autoResizingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    autoResizingBtn.frame  = CGRectMake((screen.size.width - 180)/2, 160, 180, 30);
    [autoResizingBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    autoResizingBtn.tag = 2;
    [autoResizingBtn setTitle:@"Autoresizing Layout Demo" forState:UIControlStateNormal];
    [autoResizingBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:autoResizingBtn];

    
    /// 3.添加Constraint布局按钮
    UIButton *constraintBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    constraintBtn.frame  = CGRectMake((screen.size.width - 180)/2, 200, 180, 30);
    [constraintBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    constraintBtn.tag = 3;
    [constraintBtn setTitle:@"Constraint Layout Demo" forState:UIControlStateNormal];
    [constraintBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:constraintBtn];
    
    /// 4.添加StackView 布局按钮
    UIButton *stackViewBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    stackViewBtn.frame  = CGRectMake((screen.size.width - 180)/2, 240, 180, 30);
    [stackViewBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    stackViewBtn.tag = 4;
    [stackViewBtn setTitle:@"StackView Layout Demo" forState:UIControlStateNormal];
    [stackViewBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stackViewBtn];

    /// 5.添加Masonry 布局按钮
    UIButton *masonryBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    masonryBtn.frame  = CGRectMake((screen.size.width - 180)/2, 280, 180, 30);
    [masonryBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    masonryBtn.tag = 5;
    [masonryBtn setTitle:@"Masonry Layout Demo" forState:UIControlStateNormal];
    [masonryBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:masonryBtn];
}


//重写init方法
-(id) init {
    if ([super init] != nil)
    {
        // 为该控制器设置标签项
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
        self.tabBarItem.badgeValue = @"3";
    
    }
    
    return self;
}


- (void) onClick: (UIButton *) button {
    FrameLayoutViewController *frameLayoutVC = [[FrameLayoutViewController alloc] init];
    MBSMasonryViewController  *masonryLayoutVC = [[MBSMasonryViewController alloc] init];
    MBSConstraintViewController  *constraintLayoutVC = [[MBSConstraintViewController alloc] init];
    AutoresizingViewController  *autoresizingVC = [[AutoresizingViewController alloc] init];
    
    switch (button.tag) {
        case 1: //frameLayout
           [self.navigationController pushViewController:frameLayoutVC animated:NO];
            break;
        case 2: //auytoresizingLayout
            [self.navigationController pushViewController:autoresizingVC animated:NO];
            break;
        case 3: //constraintLayout
            [self.navigationController pushViewController:constraintLayoutVC animated:NO];
            break;
        case 4: //masonryLayout
            [self.navigationController pushViewController:masonryLayoutVC animated:NO];
            break;
        default:
            break;
    }
    
   
}


@end
