//
//  WXWindow.m
//  loginDemo
//
//  Created by 陈波涛 on 16/7/26.
//  Copyright © 2016年 weixun. All rights reserved.
//

#import "WXWindow.h"
#import "WXLoginController.h"

@implementation WXWindow

+ (instancetype)sharedInstance{

    static WXWindow * sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        sharedInstance.backgroundColor = [UIColor whiteColor];
        
        
    });

    return sharedInstance;
    
}



- (id)initWithFrame:(CGRect)frame{


    if (self = [super initWithFrame:frame]) {
        
        WXLoginController * loginController = [WXLoginController showLoginContoller:YES];
        
        self.rootViewController = loginController;
        
        
    }

    return self;
}

+ (void)hideWindow{

    [WXWindow sharedInstance].hidden = YES;

}

@end
