//
//  WXDemoView.m
//  loginDemo
//
//  Created by 陈波涛 on 16/7/26.
//  Copyright © 2016年 weixun. All rights reserved.
//

#import "WXDemoView.h"
#import "WXWindow.h"

@implementation WXDemoView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CATransition *anim = [[CATransition alloc] init];
    
    // 指定动画类型
    anim.type = @"moveIn";
    
    anim.duration = 0.5f;
    
    anim.subtype = kCATransitionFromTop;
    
    UIWindow * window = [WXWindow sharedInstance];
    
    window.windowLevel = normal;
    
    [window.layer addAnimation:anim forKey:nil];
    
    window.hidden = NO;
    
//    [WXWindow sharedInstance].hidden = YES;
    
}


@end
