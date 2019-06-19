//
//  MBSNetworkViewController.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/18.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSNetworkViewController.h"

@interface MBSNetworkViewController ()

@end

@implementation MBSNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}



- (void) setUpUI {
    self.navigationItem.title = @"Network Demo";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(timerTick)
                                   userInfo:nil
                                    repeats:YES];
    
    
    /// 1.添加NSData + NSURL 示例
    UIButton *mbsNSDataDemoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    mbsNSDataDemoBtn.frame  = CGRectMake((screen.size.width - 300)/2, 120, 300, 30);
    [mbsNSDataDemoBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    mbsNSDataDemoBtn.tag = 1;
    [mbsNSDataDemoBtn setTitle:@"NSData + NSURL Sync Request Demo" forState:UIControlStateNormal];
    [mbsNSDataDemoBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mbsNSDataDemoBtn];
    
}


- (void) timerTick {
    NSLog(@"%@",[NSDate date]);
}

- (void) onClick: (UIButton *) button {
    switch (button.tag) {
        case 1: //NSData + NSURL  同步请求，阻塞队列
            [self syncRequestWithNSData];
            break;
        default:
            break;
    }
    
    
}


#pragma mark - 网络请求

/**
 NSData + NSURL  同步请求，阻塞队列
 */
- (void) syncRequestWithNSData {
    ///@TODO alert  弹窗
    
    // h使用node搭建本地HTTP服务，访问端口号8001
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8001"]];
    NSURLResponse *resp;
    NSError *err;
    
    //sendSynchronousRequest 方法已被废弃
    NSData *data = [NSURLConnection sendSynchronousRequest:req
                                         returningResponse:&resp
                                                     error:&err ];
    NSLog(@"====请求开始====");
    //检查错误
    if (err) {
        NSLog(@"====err====%@",err);
        NSLog(@"==resq====%@",resp);
        return;
    }
    //检验状态码
    if ([resp isKindOfClass:[NSHTTPURLResponse class]]) {
        if (((NSHTTPURLResponse *)resp).statusCode != 200) {
            return;
        }
    }
    // 解析JSON
    // 将JSON对象解析为Foundation Object
    NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data
                                                options:NSJSONReadingAllowFragments
                                                  error:&err ]);
    NSLog(@"====请求结束====");
}

@end
