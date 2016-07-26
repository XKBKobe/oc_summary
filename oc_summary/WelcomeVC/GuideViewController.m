//
//  GuideViewController.m
//  Xkb_TabBar
//
//  Created by asto on 15/11/5.
//  Copyright © 2015年 asto_Xkb. All rights reserved.
//


#import "GuideViewController.h"
#import "AppDelegate.h"
#import "TabBarController.h"

//获取屏幕 宽度、高度、scale
#define SCREEN_HEIGHT          ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WIDTH           ([UIScreen mainScreen].bounds.size.width)

@interface GuideViewController ()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *page;


@end

@implementation GuideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置Scroll
    [self setScrollView];
    
    //设置PageControl
    [self setPageControl];
}

- (void)setPageControl
{
    _page = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /2 - 80, SCREEN_HEIGHT - 180, 160, 50)];
    _page.numberOfPages = 3;
    
    _page.currentPage = 0;
    _page.currentPageIndicatorTintColor = [UIColor redColor];
    _page.pageIndicatorTintColor = [UIColor greenColor];
    [_page addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_page];
}

- (void)setScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *3, 0);
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    
    [self.view addSubview:_scrollView];
    for (int i = 0; i < 3; i ++)
    {
        UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(i *SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        bgImg.image = [UIImage imageNamed:@"splash-480-640"];
        bgImg.userInteractionEnabled = YES;
        if ( i == 2)
        {
            [self setLastImg:bgImg];
            
        }
        [_scrollView addSubview:bgImg];
    }
}

- (void)changePage:(UIPageControl *)page
{
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH *page.currentPage, 0) animated:YES];
}

- (void)setLastImg:(UIImageView *)lastImg
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREEN_WIDTH/2 - 60, SCREEN_HEIGHT - 100, 120, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"立即体验" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [lastImg addSubview:button];
}

- (void)btnClick
{
    [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        _scrollView.alpha = 0.4;
    } completion:^(BOOL finished) {
            [self removeFromParentViewController];
    }];
    UIWindow *window = [[[UIApplication sharedApplication] delegate]window];
    TabBarController *tabBarController = [[TabBarController alloc] init];
    window.rootViewController = tabBarController;
}

#pragma mark
#pragma mark -- UIScrollView的代理协议方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _page.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
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
