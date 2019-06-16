//
//  AppDelegate.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/16.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 初始化 tabBar 控制器
    UITabBarController *mbsTabBarController = [[UITabBarController alloc] init];
    // 设置 UIWindow 的 rootViewController 为 UITabBarController
    self.window.rootViewController = mbsTabBarController;

    
    
    //创建对应的子控制器
    UIViewController *mbsVC1 = [[UIViewController alloc] init];
    mbsVC1.view.backgroundColor = [UIColor greenColor];
    mbsVC1.tabBarItem.title = @"Home";
    mbsVC1.tabBarItem.image = [[UIImage imageNamed:@"Home_normal"]
                               imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mbsVC1.tabBarItem.selectedImage = [[UIImage imageNamed:@"Home_selected"]
                                       imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIViewController *mbsVC2 = [[UIViewController alloc] init];
    mbsVC2.view.backgroundColor = [UIColor blueColor];
    mbsVC2.tabBarItem.title = @"Category";
    mbsVC2.tabBarItem.image = [[UIImage imageNamed:@"Category_normal"]
                               imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mbsVC2.tabBarItem.selectedImage = [[UIImage imageNamed:@"Category_selected"]
                                       imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    // 将子控制器添加到 UITabBarController
    mbsTabBarController.viewControllers = @[mbsVC1,mbsVC2];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
