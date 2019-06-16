//
//  FrameLayoutViewController.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/16.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "FrameLayoutViewController.h"

@interface FrameLayoutViewController ()

@end

@implementation FrameLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *labelId = [[UILabel alloc] initWithFrame:CGRectMake(80,115, 80, 21)];
    labelId.text = @"用户ID：";
    [self.view addSubview:labelId];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
