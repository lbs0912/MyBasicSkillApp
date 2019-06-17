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
    
    /// 2.添加Masonry 布局按钮
    UIButton *masonryBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    masonryBtn.frame  = CGRectMake((screen.size.width - 180)/2, 160, 180, 30);
    [masonryBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    masonryBtn.tag = 2;
    [masonryBtn setTitle:@"Masonry Layout Demo" forState:UIControlStateNormal];
    [masonryBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:masonryBtn];
    
    /// 3.添加Constraint布局按钮
    UIButton *constraintBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    constraintBtn.frame  = CGRectMake((screen.size.width - 180)/2, 200, 180, 30);
    [constraintBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    constraintBtn.tag = 3;
    [constraintBtn setTitle:@"Constraint Layout Demo" forState:UIControlStateNormal];
    [constraintBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:constraintBtn];
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
    
    switch (button.tag) {
        case 1: //frameLayout
           [self.navigationController pushViewController:frameLayoutVC animated:NO];
            break;
        case 2: //masonryLayout
            [self.navigationController pushViewController:masonryLayoutVC animated:NO];
            break;
        case 3: //constraintLayout
            [self.navigationController pushViewController:constraintLayoutVC animated:NO];
            break;
        default:
            break;
    }
    
   
}


@end
