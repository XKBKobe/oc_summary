//
//  ProtocolViewController.h
//  oc_summary
//
//  Created by asto on 16/7/21.
//  Copyright © 2016年 asto_Xkb. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  下面是声明协议的固定格式，DaChuDelegate是协议的名称，因为是代理协议，名称格式为：类名+Delegate
 */
@protocol ProtocolViewControllerDelegate<NSObject>
//可选
@optional
-(void)cbfun:(NSString *)call;
@end

@interface ProtocolViewController : UIViewController
/**
 为了防止，代理协议时的循环使用，释放不掉
 */
//注意在此处描述代理在（ARC）如下：


/**
 *  delegate 是dachu类的一个属性，weak 关键字是为了避免循环引用，<DaChuDelegate>表示遵守DaChuDelegate协议
 *  更加直白点：在大厨心里有一个人接受他的菜好了的信号去做一些事情，具体这个人是谁，大厨不关心，这个人的代号是delegate
 */

@property(nonatomic,unsafe_unretained) id<ProtocolViewControllerDelegate>delagate;
//在mrc上需要用
//@property(nonatomic,assign) id<customDelegate>delagate;


@end
