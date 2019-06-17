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
    self.navigationItem.title = @"Constraint (AutoLayout) Demo";
    
    _mbConstraintView = [[MBSConstraintView alloc] initWithFrame:self.view.bounds];
    _mbConstraintView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_mbConstraintView];

}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    //frame布局 重新设定self.view.bounds
    _mbConstraintView.frame = self.view.bounds;
}



@end
