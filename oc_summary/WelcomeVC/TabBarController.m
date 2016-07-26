//
//  TabBarController.m
//  Xkb_TabBar
//
//  Created by asto on 15/11/5.
//  Copyright © 2015年 asto_Xkb. All rights reserved.
//

#import "TabBarController.h"
#import "HomeViewController.h"
#import "MyLoanViewController.h"
#import "MyDataViewController.h"
#import "MyCenterViewController.h"


@interface TabBarController ()

@end
@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.设置状态栏的颜色UIStatusBarStyleLightContent（白色）／UIStatusBarStyleDefault（黑色）
    //2.并将在info.plist中，将View controller-based status bar appearance设为NO
     [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //导航的背景颜色
    [[UINavigationBar appearance] setBarTintColor: [UIColor colorWithRed:0 green:150/255.0 blue:220/255.0 alpha:1]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //设置导航的字体
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor whiteColor], NSForegroundColorAttributeName, nil]];

    
    //tabBar 背景色
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
        
    //首页
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
     homeNav.tabBarItem.title = @"首页";
    
    
    //我的贷款
    MyLoanViewController *myLoanVC = [[MyLoanViewController alloc] init];
    UINavigationController *myLoanNav = [[UINavigationController alloc] initWithRootViewController:myLoanVC];
    myLoanNav.tabBarItem.title = @"我的申请";

    
    
    //我的资料
    MyDataViewController *myDataVC = [[MyDataViewController alloc] init];
    UINavigationController *myDataNav = [[UINavigationController alloc] initWithRootViewController:myDataVC];
    myDataNav.tabBarItem.title = @"我的资料";
    
    
    //个人中心
    MyCenterViewController *myCenterVC = [[MyCenterViewController alloc] init];
    UINavigationController *myCenterNav = [[UINavigationController alloc] initWithRootViewController:myCenterVC];
      myCenterNav.tabBarItem.title = @"个人中心";
    
    
    self.viewControllers = [NSArray arrayWithObjects:homeNav,myLoanNav,myDataNav,myCenterNav, nil];
    
    //点击选中的图片
    NSArray *imageArraySelect = [[NSArray alloc] initWithObjects:@"tab1_select",@"tab2_select",@"tab3_select",@"tab4_select",nil];
    //默认的图片
    NSArray *imageArrayDefault = [[NSArray alloc] initWithObjects:@"tab1_normal",@"tab2_normal",@"tab3_normal",@"tab4_normal" ,nil];
    

    NSArray *titleArray = [[NSArray alloc] initWithObjects:@"首页",@"我的申请",@"我的资料",@"个人中心", nil];
    NSDictionary *dicSelect = [[NSDictionary alloc] initWithObjects:imageArraySelect forKeys:titleArray];
    NSDictionary *dicDefault = [[NSDictionary alloc] initWithObjects:imageArrayDefault forKeys:titleArray];

    for (UITabBarItem *item in self.tabBar.items)//选项卡 字体颜色
    {
        //设置选中的图拼啊
        [item setSelectedImage:[[UIImage imageNamed:[dicSelect objectForKey:item.title]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        //设置默认的图片
        [item setImage:[[UIImage imageNamed:[dicDefault objectForKey:item.title]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        //设置选中字体的颜色
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor colorWithRed:0 green:150/255.0 blue:220/255.0 alpha:1],NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    }

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
