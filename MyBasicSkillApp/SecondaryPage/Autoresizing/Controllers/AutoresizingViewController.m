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

//@property (nonatomic, strong) UIView *contentView;

@end

@implementation AutoresizingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Autoresizing Layout Demo";
    
    
      //使用autolayout布局，旋转屏幕，填充满整个屏幕
//    _contentView = [[UIView alloc] initWithFrame:self.view.bounds];
//    _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    _contentView.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:_contentView];
    
    

    //使用autolayout布局， 四等分屏幕
    _mbsAutoresizingView = [[MBSAutoresizingView alloc] initWithFrame:self.view.bounds];
    _mbsAutoresizingView.backgroundColor = [UIColor grayColor];
    _mbsAutoresizingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_mbsAutoresizingView];
    
}





@end
