//
//  MBSMasonryViewController.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/16.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSMasonryViewController.h"
#import "MBSMasonryContentView.h"
#import "Masonry.h"

@interface MBSMasonryViewController ()
@property (nonatomic, strong) MBSMasonryContentView  *mbsMasonryContentView;
@end

@implementation MBSMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Masonry Layout Demo";

    _mbsMasonryContentView = [[MBSMasonryContentView alloc] initWithFrame:self.view.bounds];
    _mbsMasonryContentView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_mbsMasonryContentView];
    
    [_mbsMasonryContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(88.0);;
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-88.0);
        
    }];
}


@end
