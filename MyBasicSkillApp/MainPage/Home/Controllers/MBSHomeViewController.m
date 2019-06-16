//
//  MBSHomeViewController.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/16.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSHomeViewController.h"
#import "FrameLayoutViewController.h"

@interface MBSHomeViewController ()

@end

@implementation MBSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.view.backgroundColor = [UIColor lightGrayColor];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    /// 1.添加Frame 布局按钮
    UIButton *frameBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    frameBtn.frame  = CGRectMake((screen.size.width - 180)/2, 120, 180, 30);
    [frameBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [frameBtn setTitle:@"Frame Layout Demo" forState:UIControlStateNormal];
    [frameBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:frameBtn];
    
    
   
    
    

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




- (void) onClick: (id) sender {
    FrameLayoutViewController *frameLayoutVC = [[FrameLayoutViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frameLayoutVC];
    //展示模态窗
//    [self presentedViewController: navigationController animated: TRUE completion: nil];
}

@end
