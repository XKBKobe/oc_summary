//
//  ViewController.m
//  Xkb_TabBar
//
//  Created by asto on 15/11/5.
//  Copyright © 2015年 asto_Xkb. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "TabBarController.h"
#import "GuideViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置地步TabBar
    [self setTabBarController];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark
#pragma mark --设置tabBar
- (void)setTabBarController{
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate]window];
    window.backgroundColor = [UIColor whiteColor];
    NSString *key = @"CFBundleVersion";
    
    // 取出沙盒中存储的上次使用软件的版本号
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults stringForKey:key];
    
    // 获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion])
    {
        TabBarController *tabBarVC = [[TabBarController alloc] init];
        window.rootViewController = tabBarVC;
    }
    else
    { // 新版本
        window.rootViewController = [[GuideViewController alloc] init];
        // 存储新版本
        [defaults setObject:currentVersion forKey:key];
        [defaults synchronize];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
