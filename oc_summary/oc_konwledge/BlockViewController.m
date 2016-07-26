//
//  BlockViewController.m
//  oc_summary
//
//  Created by asto on 16/7/21.
//  Copyright © 2016年 asto_Xkb. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

//第二种：定义block类型
//注意这后面加不加参数值
typedef NSString *(^blockTypeA) (NSString *);
typedef NSString *(^blockTypeB) (NSString *);

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"block的使用");
    
    /**
     block:实际是oc对闭包的实现：定义－－－》赋值－－－》调用
     */
    //block的使用，类似于，js中回调函数。
    
    
    
    //第一种：
    /**
     参数NSString*:指返回的类型为字符串，^:是声明block的，myblock:是block的名称（函数名），int:传递参数的类型  类似于生命了一个函数。
      NSString *(^ myblcok)(int);
     */
    
    //（1）定义无参数无返回的block
    void (^ voidBlock)() = ^(){
        NSLog(@"定义无参数无返回的block");
    };
    //调用block
    voidBlock();
    
    
    //（2）定义有参数又返回值的block
    NSString *(^ strCbfun)(NSString *)= ^(NSString * str ){
        return @"123";
    };
    
   NSString * str =  strCbfun(@"123");
    NSLog(@"%@",str);
    
    
    //第二种：
    /**
     由于block数据类型的语法会降低整个代码的阅读性，所以常使用typedef来定义block类型。例如，下面的代码创建了blockTypeA和blockTypeB两个新类型，这样我们就可以在下面的方法中使用更加有语义的数据类型。
     
     */
    
    //注意typedef NSString *(^blockTypeA) (NSString *);中又返回值nsstring，下面的方法必须要有字符串的返回值。
    
    [self getBlockA:^NSString *(NSString *typeA){
        NSLog(@"%@",typeA);
        return @"123";
    } getBlockB:^NSString *(NSString *typeB) {
        NSLog(@"%@",typeB);
        return @"321";
    }];
    
    
    [self getBlock:^NSString *(NSString *call) {
        NSLog(@"%@",call);
        return call;
    }];
    
    
    
    //第三种@proprety描述block的使用
    self.cbfunBlock(@"come on baby");
    
}

//第二种定义类型的block（blockTypeA：相当于了一个类型，nsstring）
-(void)getBlockA:(blockTypeA)typeA getBlockB:(blockTypeB)typeB{
    //回调
    typeA(@"12345");
    typeB(@"54321");
}

//将block作为参数传递（myblock为block的名称与之前的相反）类似  NSString *(^myblock)(NSString *);

-(void)getBlock:(NSString *(^)(NSString *))myblock{
    //回调
    myblock(@"kobe");
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
