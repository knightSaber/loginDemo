//
//  WXLoginController.m
//  TaiS
//
//  Created by 陈波涛 on 16/5/18.
//  Copyright © 2016年 weixun. All rights reserved.
//

#import "WXLoginController.h"
#import "WXWindow.h"

@interface WXLoginController()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *agreeDeleteLabel;

@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;

@property(nonatomic,retain) NSTimer *timer;

@property (nonatomic, strong) UIButton *closeButton;


@property (weak, nonatomic) IBOutlet UIImageView *agreeImage;


@property (nonatomic, assign)  BOOL isAgree;

@property (weak, nonatomic) IBOutlet UILabel *showEorrorMsg;

@property (weak, nonatomic) IBOutlet UIImageView *closeImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *errorLabelTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *errorLabelBottom;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *agreeLabelTop;



@end


@implementation WXLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUi];

}



#pragma mark-展出登录界面
+(WXLoginController *)showLoginContoller:(BOOL)isVistor{
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"WXLoginController" bundle:nil];
    
    WXLoginController * loginController = (WXLoginController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"WXLoginController"];
    
    loginController.isShowVisitorController = isVistor;
    
    return loginController;
    
}



#pragma mark-展出登录界面
+(WXLoginController *)showLoginContoller:(BOOL)isVistor andIsShowColse:(BOOL)isShowClose{
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"WXLoginController" bundle:nil];
    
    WXLoginController * loginController = (WXLoginController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"WXLoginController"];
    
    loginController.isShowVisitorController = isVistor;
    
    loginController.closeImage.hidden = !isShowClose;

    
    return loginController;
    
}


- (void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}





#pragma mark-展出登录界面
+(WXLoginController *)showLoginContoller{
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"WXLoginController" bundle:nil];
    
    WXLoginController * loginController = (WXLoginController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"WXLoginController"];
    
    return loginController;
    
}


- (void)setIsAgree:(BOOL)isAgree{
    
    _isAgree = isAgree;
    
//    [self.loginBtn setEnabled:self.isAgree];
    
    if (self.isAgree) {
        
        self.agreeImage.image = [UIImage imageNamed:@"tongyi"];
        
    }else{
        
        self.agreeImage.image = [UIImage imageNamed:@"tongyi2"];
    }
    
}

//初始化ui
- (void)setUpUi{
    
    
    self.isAgree = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(agreeImageClick)];
    
    [self.agreeImage addGestureRecognizer:tap];
    
    self.agreeImage.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeImageClick)];
    
    [self.closeImage addGestureRecognizer:tap1];
    
    self.closeImage.userInteractionEnabled = YES;
    
    
    
    [self.view addSubview:self.closeButton];
    
    
    
    self.loginBtn.layer.cornerRadius = 20;
    
    self.loginBtn.layer.masksToBounds = YES;
    
    [self.loginBtn setEnabled:YES];
    
    [self.loginBtn setBackgroundImage:[UIImage imageNamed:@"下一步-不可点击"] forState:UIControlStateDisabled];
    
    self.mobileTextField.delegate = self;
    
    self.codeTextField.delegate = self;
    
    [self.mobileTextField addTarget:self action:@selector(mobileOrCodeTextFieldChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.codeTextField addTarget:self action:@selector(mobileOrCodeTextFieldChange) forControlEvents:UIControlEventEditingChanged];
    
    self.getCodeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.loginBtn.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(self.loginBtn.bounds.size.height/2, self.loginBtn.bounds.size.height/2)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.loginBtn.bounds;
    maskLayer.path = maskPath.CGPath;
    self.loginBtn.layer.mask = maskLayer;
    
}

#pragma mark -手机号码和验证码
- (void)mobileOrCodeTextFieldChange{
    
    if (self.mobileTextField.text.length > 11) {
        
        self.mobileTextField.text = [self.mobileTextField.text substringToIndex:11];
        
    }
    
    if (self.codeTextField.text.length > 4) {
        
        self.codeTextField.text = [self.codeTextField.text substringToIndex:4];
        
    }
}



#pragma mark -获取验证码之后的事件
- (void)getCodeSuccess{
    
    [self.codeTextField becomeFirstResponder];
    
    [self.getCodeBtn setEnabled:NO];
    
    [self.getCodeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
}


#pragma mark -登录
- (IBAction)loginButtonClick {
    
    //退出登录
    [WXWindow sharedInstance].hidden = YES;
    
}




#pragma mark -dealloc
- (void)dealloc{
    
    NSLog(@"WXLoginController被成功释放");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



#pragma mark 关闭控制器
- (void)closeLoginController{
    if (self.closeBlock) {
        self.closeBlock(nil);
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


@end
