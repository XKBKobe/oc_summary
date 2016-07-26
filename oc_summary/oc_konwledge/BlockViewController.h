//
//  BlockViewController.h
//  oc_summary
//
//  Created by asto on 16/7/21.
//  Copyright © 2016年 asto_Xkb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockViewController : UIViewController
//声明一个block
@property(nonatomic,assign) NSString * (^ cbfunBlock)(NSString *);


/**
 我们用脚本语言来看一下：
 function funA(callback){
 alert(callback());
 }
 
 function funB(){
 var str = "Hello World"; // 函数funB的局部变量，函数funA的非局部变量
 funA（
 function（）{
 return str;
 }
 ）；
 }
 通过上面的代码我们可以看出，按常规思维来说，变量str是函数funB的局部变量，作用域只在函数funB中，函数funA是无法访问到str的。但是上述代码示例中函数funA中的callback可以访问到str，这是为什么呢，因为闭包性。
 
 */

@end
