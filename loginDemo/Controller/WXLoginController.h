//
//  WXLoginController.h
//  TaiS
//
//  Created by 陈波涛 on 16/5/18.
//  Copyright © 2016年 weixun. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ctrlCloseBlock)(id);

@interface WXLoginController : UIViewController


+(WXLoginController *)showLoginContoller:(BOOL)isVistor;

@property (nonatomic, strong) ctrlCloseBlock closeBlock;

@property (nonatomic, assign) BOOL isShowVisitorController;

+(WXLoginController *)showLoginContoller:(BOOL)isVistor andIsShowColse:(BOOL)isShowClose;

@end
