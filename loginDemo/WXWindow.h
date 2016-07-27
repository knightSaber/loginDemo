//
//  WXWindow.h
//  loginDemo
//
//  Created by 陈波涛 on 16/7/26.
//  Copyright © 2016年 weixun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXWindow : UIWindow

/**
 *  单例
 *
 *  @return
 */
+ (instancetype)sharedInstance;

/**
 *  隐藏
 */
+ (void)hideWindow;

@end
