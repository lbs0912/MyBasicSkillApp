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
#import "MBSNetworkViewController.h"
#import "MBSViewControllerLifeTest.h"


@interface MBSHomeViewController ()

@end

@implementation MBSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
//    NSLog(@"========   HomeViewController 将要加载视图： viewDidLoad   =======\n");
    [self setUpUI];
}


#pragma mark - life cycle

+ (void)initialize {
//    NSLog(@"========   HomeViewController  类初始化方法： initialize   =======\n");
}


//重写init方法
-(instancetype) init {
    if ([super init] != nil)
    {
        // 为该控制器设置标签项
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
        self.tabBarItem.badgeValue = @"3";
        
    }
//    NSLog(@"========    HomeViewController 实例初始化方法： init   =======\n");
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
//    NSLog(@"========    HomeViewController 从归档初始化：  initWithCoder:(NSCoder *)aDecoder   =======\n");
    return self;
}

- (void)loadView {
    [super loadView];
//    NSLog(@"========    HomeViewController 加载视图： loadView   =======\n");
}



- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
//    NSLog(@"========    HomeViewController 将要布局子视图： viewWillLayoutSubviews   =======\n");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    NSLog(@"========    HomeViewController 已经布局子视图： viewDidLayoutSubviews   =======\n");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
//    NSLog(@"========   收到内存警告： didReceiveMemoryWarning   =======\n");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSLog(@"========    HomeViewController 视图将要出现： viewWillAppear:(BOOL)animated   =======\n");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    NSLog(@"========    HomeViewController 视图已经出现： viewDidAppear:(BOOL)animated   =======\n");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    NSLog(@"========    HomeViewController 视图将要消失： viewWillDisappear:(BOOL)animated   =======\n");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    NSLog(@"========    HomeViewController 视图已经消失： viewDidDisappear:(BOOL)animated   =======\n");
}

- (void)dealloc {
//    NSLog(@"========   HomeViewController  释放： dealloc   =======\n");
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
    constraintBtn.frame  = CGRectMake((screen.size.width - 220)/2, 200, 220, 30);
    [constraintBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    constraintBtn.tag = 3;
    [constraintBtn setTitle:@"Constraint (AutoLayout) Demo" forState:UIControlStateNormal];
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
    
    /// 6.添加 NetworkDemo 按钮
    UIButton *networkDemoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    networkDemoBtn.frame  = CGRectMake((screen.size.width - 180)/2, 320, 180, 30);
    [networkDemoBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    networkDemoBtn.tag = 6;
    [networkDemoBtn setTitle:@"Network Demo" forState:UIControlStateNormal];
    [networkDemoBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:networkDemoBtn];
    
    /// 7. ViewController 生命周期测试
    UIButton *viewControllerLifeCycleTest = [UIButton buttonWithType:UIButtonTypeSystem];
    viewControllerLifeCycleTest.frame  = CGRectMake((screen.size.width - 320)/2, 360, 320, 30);
    [viewControllerLifeCycleTest setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    viewControllerLifeCycleTest.tag = 7;
    [viewControllerLifeCycleTest setTitle:@"ViewController LifeCycle Test" forState:UIControlStateNormal];
    [viewControllerLifeCycleTest addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:viewControllerLifeCycleTest];
}



- (void) onClick: (UIButton *) button {
    FrameLayoutViewController *frameLayoutVC = [[FrameLayoutViewController alloc] init];
    MBSMasonryViewController  *masonryLayoutVC = [[MBSMasonryViewController alloc] init];
    MBSConstraintViewController  *constraintLayoutVC = [[MBSConstraintViewController alloc] init];
    AutoresizingViewController  *autoresizingVC = [[AutoresizingViewController alloc] init];
    MBSNetworkViewController *mbsNetworkViewController = [[MBSNetworkViewController alloc] init];
    MBSViewControllerLifeTest *mbsViewControllerLifeTest = [[MBSViewControllerLifeTest alloc] init];
    
    switch (button.tag) {
        case 1: //frameLayout
           [self.navigationController pushViewController:frameLayoutVC animated:NO];
            break;
        case 2: //auytoresizingLayout
            [self.navigationController pushViewController:autoresizingVC animated:YES];
            break;
        case 3: //constraintLayout
            [self.navigationController pushViewController:constraintLayoutVC animated:NO];
            break;
        case 4: //masonryLayout
            [self.navigationController pushViewController:masonryLayoutVC animated:NO];
            break;
        case 5: //masonryLayout
            [self.navigationController pushViewController:masonryLayoutVC animated:NO];
            break;
        case 6:
            [self.navigationController pushViewController:mbsNetworkViewController animated:YES];
            break;
        case 7:
            [self.navigationController pushViewController:mbsViewControllerLifeTest animated:NO];
            break;
        default:
            break;
    }
    
   
}


@end
