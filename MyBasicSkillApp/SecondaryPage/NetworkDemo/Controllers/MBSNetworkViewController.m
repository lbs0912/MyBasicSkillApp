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
    
    //定时器-每隔1秒打印时间戳，用于表示主线程是否阻塞
//    [NSTimer scheduledTimerWithTimeInterval:1
//                                     target:self
//                                   selector:@selector(timerTick)
//                                   userInfo:nil
//                                    repeats:YES];
    
    
    /// 1.添加NSData + NSURL 示例 同步HTTP请求
    UIButton *mbsNSDataDemoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    mbsNSDataDemoBtn.frame  = CGRectMake((screen.size.width - 300)/2, 120, 300, 30);
    [mbsNSDataDemoBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    mbsNSDataDemoBtn.tag = 1;
    [mbsNSDataDemoBtn setTitle:@"NSData + NSURL Sync Request Demo" forState:UIControlStateNormal];
    [mbsNSDataDemoBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mbsNSDataDemoBtn];
    
    /// 2.添加NSURLConnection  异步队列请求
    UIButton *mbsNSURLConnectionQueueBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    mbsNSURLConnectionQueueBtn.frame  = CGRectMake((screen.size.width - 300)/2, 160, 300, 30);
    [mbsNSURLConnectionQueueBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    mbsNSURLConnectionQueueBtn.tag = 2;
    [mbsNSURLConnectionQueueBtn setTitle:@"NSURLConnection Async Queue Request" forState:UIControlStateNormal];
    [mbsNSURLConnectionQueueBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mbsNSURLConnectionQueueBtn];
    
    /// 3.添加NSURLConnection  异步请求
    UIButton *mbsNSURLConnectionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    mbsNSURLConnectionBtn.frame  = CGRectMake((screen.size.width - 300)/2, 200, 300, 30);
    [mbsNSURLConnectionBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    mbsNSURLConnectionBtn.tag = 3;
    [mbsNSURLConnectionBtn setTitle:@"NSURLConnection Async Request" forState:UIControlStateNormal];
    [mbsNSURLConnectionBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mbsNSURLConnectionBtn];
    
    /// 4.添加HTTPS异步请求
    UIButton *httpsAsyncRequestBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    httpsAsyncRequestBtn.frame  = CGRectMake((screen.size.width - 300)/2, 240, 300, 30);
    [httpsAsyncRequestBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    httpsAsyncRequestBtn.tag = 4;
    [httpsAsyncRequestBtn setTitle:@"HTTPS Async Request" forState:UIControlStateNormal];
    [httpsAsyncRequestBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:httpsAsyncRequestBtn];
    
}


- (void) showTipAlert {
    //1. 初始化
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Tip"
                                                                             message:@"Show NSLog for information"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    // 2.创建并添加按钮
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // do something
    }];
    [alertController addAction:okAction];
    
    //3. 展示
    [self presentViewController:alertController animated:YES completion:nil];
   
}

- (void) timerTick {
    NSLog(@"%@",[NSDate date]);
}

- (void) onClick: (UIButton *) button {
    switch (button.tag) {
        case 1: //NSData + NSURL  同步请求，阻塞队列
            [self syncRequestWithNSData];
            break;
        case 2: //NSURLConnection 异步队列请求
            [self asyncRequestQueueWithNSURLConnection];
            break;
        case 3: //NSURLConnection HTTP 异步请求
            [self asyncRequestWithNSURLConnection];
            break;
        case 4: // HTTPS 异步请求
            [self httpsAsyncRequestWithNSURLConnection];
            break;
        default:
            break;
    }
    
    
}


#pragma mark - 同步请求

/**
 NSData + NSURL  同步请求，阻塞队列
 */
- (void) syncRequestWithNSData {
 
    [self showTipAlert];
    
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



# pragma mark 异步队列请求
/**
 NSURLConnection 异步队列请求
 */
-(void) asyncRequestQueueWithNSURLConnection{
    
    [self showTipAlert];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8001"]];
    NSURLResponse *resp;
    NSOperationQueue *queue = [[NSOperationQueue alloc]init]; //创建子线程
//     NSOperationQueue *queue = [NSOperationQueue mainQueue];  //主线程
    
    //发送异步队列请求
    [NSURLConnection sendAsynchronousRequest:req
                                       queue:queue
                           completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSLog(@"====sleep start ====");
        sleep(5);
        NSLog(@"====sleep end ====");
                               
        //检查错误
        if (connectionError) {
            NSLog(@"%@",connectionError);
            NSLog(@"==resq====%@",resp);
            return;
        }
        //检验状态码
        if ([resp isKindOfClass:[NSHTTPURLResponse class]]) {
            if (((NSHTTPURLResponse *)resp).statusCode != 200) {
                return;
            }
        }
                               
     
        //解析json
        NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data
                                                    options:NSJSONReadingAllowFragments
                                                      error:nil ]);
        NSLog(@"====异步队列请求结束====");
    }];
    
    NSLog(@"====异步队列请求开始====");
}


# pragma mark 普通HTTP异步请求 - 发起请求

/**
 NSURLConnection 异步请求
 */
-(void) asyncRequestWithNSURLConnection {
    [self showTipAlert];
    
    NSString *urlString = @"http://localhost:8001/";
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

#pragma mark - 普通HTTP异步请求 - 网络请求委托

//请求失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"=================didFailWithError=================");
    NSLog(@"error:%@",error);
}

//重定向
- (nullable NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(nullable NSURLResponse *)response{
    NSLog(@"=================request redirectResponse=================");
    NSLog(@"request:%@",request);
    return request;
}

//接收响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"=================didReceiveResponse=================");
    NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
    NSLog(@"response:%@",resp);
    
}

//接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"=================didReceiveData=================");
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"data:%@",dic);
    
}


//上传数据委托，用于显示上传进度
- (void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten
  totalBytesWritten:(NSInteger)totalBytesWritten
  totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite{
    NSLog(@"=================totalBytesWritten=================");
}

//完成请求
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"=================connectionDidFinishLoading=================");
}



#pragma mark - HTTPS 异步请求
- (void) httpsAsyncRequestWithNSURLConnection {
    //string 转 url编码
    NSString *urlString = @"https://api.github.com/users/lbs0912";
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

#pragma mark - HTTPS 异步请求 - https 认证
-(BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection{
    NSLog(@"=================connectionShouldUseCredentialStorage=================");
    return true;
}
- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    NSLog(@"=================willSendRequestForAuthenticationChallenge=================");
    NSLog(@"didReceiveAuthenticationChallenge %@ %zd", [[challenge protectionSpace] authenticationMethod], (ssize_t) [challenge previousFailureCount]);
    
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
        NSLog(@"是服务器信任的证书:%@",challenge.protectionSpace.authenticationMethod);
        //通过认证
        [[challenge sender]  useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        [[challenge sender]  continueWithoutCredentialForAuthenticationChallenge: challenge];
    }
}
@end
