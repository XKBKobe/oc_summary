//
//  ProtocolViewController.m
//  oc_summary
//
//  Created by asto on 16/7/21.
//  Copyright © 2016年 asto_Xkb. All rights reserved.
//

#import "ProtocolViewController.h"

@interface ProtocolViewController ()

@end

@implementation ProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cbfun:(NSString *)call{
    //判断是否回调
   if( [_delagate respondsToSelector:@selector(cbfun:)]){
       [_delagate cbfun:@"kobe"];
    }
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
