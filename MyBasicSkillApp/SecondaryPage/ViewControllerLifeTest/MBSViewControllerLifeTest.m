//
//  MBSViewControllerLifeTest.m
//  MyBasicSkillApp
//
//  Created by 刘保帅 on 2019/6/20.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSViewControllerLifeTest.h"

@interface MBSViewControllerLifeTest ()

@end

@implementation MBSViewControllerLifeTest



+ (void)initialize {
    NSLog(@"========   类初始化方法： initialize   =======\n");
}

- (instancetype)init {
    self = [super init];
    NSLog(@"========   实例初始化方法： init   =======\n");
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    NSLog(@"========   从归档初始化：  initWithCoder:(NSCoder *)aDecoder   =======\n");
    return self;
}

- (void)loadView {
    [super loadView];
    NSLog(@"========   加载视图： loadView   =======\n");
}

#pragma mark- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"========   将要加载视图： viewDidLoad   =======\n");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"========   将要布局子视图： viewWillLayoutSubviews   =======\n");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"========   已经布局子视图： viewDidLayoutSubviews   =======\n");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"========   收到内存警告： didReceiveMemoryWarning   =======\n");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"========   视图将要出现： viewWillAppear:(BOOL)animated   =======\n");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"========   视图已经出现： viewDidAppear:(BOOL)animated   =======\n");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"========   视图将要消失： viewWillDisappear:(BOOL)animated   =======\n");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"========   视图已经消失： viewDidDisappear:(BOOL)animated   =======\n");
}

- (void)dealloc {
    NSLog(@"========   释放： dealloc   =======\n");
}


@end
