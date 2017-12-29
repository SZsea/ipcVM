//
//  SELoginController.m
//  ipcVM
//
//  Created by Sean on 2017/12/27.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "SELoginController.h"
#import "SELoginDateProvider.h"
#import "SessionDAO.h"
#import "Session.h"

@interface SELoginController ()<UIGestureRecognizerDelegate,UITextFieldDelegate>

@property(nonatomic,strong) UILabel       *accountLabel;

@property(nonatomic,strong) UITextField   *accountText;

@property(nonatomic,strong) UILabel       *passwordLabel;

@property(nonatomic,strong) UITextField   *passwordText;

@property(nonatomic,strong) UIButton     *confirmBtn;

@property(nonatomic,strong)Session        *session;
@end

@implementation SELoginController
-(UILabel  *)accountLabel
{
    if(!_accountLabel)
    {
        _accountLabel = [[UILabel alloc] init];
        _accountLabel.text = @"账号/地址";
        _accountLabel.font = [UIFont systemFontOfSize:15.f];
        _accountLabel.textColor = MAColorWithStr(@"#ffffff");
        [_accountLabel sizeToFit];
        _accountLabel.centerY = SCREEN_HEIGHT/3 * 1;
        _accountLabel.x = 24.f;
        
        
    }
    return _accountLabel;
  
}
-(UITextField *)accountText
{
    if(!_accountText)
    {
        _accountText = [[UITextField alloc] init];
        _accountText.width = SCREEN_WIDTH - _accountLabel.width - 6.f - 48.f;
        _accountText.height = _accountLabel.height + 10.f;
        _accountText.centerY = _accountLabel.centerY;
        _accountText.x = _accountLabel.x + _accountLabel.width + 6.f;
        _accountText.backgroundColor = MAColorWithStr(@"#ffffff");
        _accountText.keyboardType = UIKeyboardTypeURL;
        _accountText.delegate = self;
     
    }
    return _accountText;
}

-(UILabel  *)passwordLabel
{
    if(!_passwordLabel)
    {
        _passwordLabel = [[UILabel alloc] init];
        _passwordLabel.text = @"密码";
        _passwordLabel.font = [UIFont systemFontOfSize:15.f];
        _passwordLabel.textColor = MAColorWithStr(@"#ffffff");
        [_passwordLabel sizeToFit];
        _passwordLabel.y = _accountLabel.y + _accountLabel.height + 40.f;
        _passwordLabel.x = _accountLabel.x;
        
        
    }
    return _passwordLabel;
    
}
-(UITextField *)passwordText
{
    if(!_passwordText)
    {
        _passwordText = [[UITextField alloc] init];
        _passwordText.width = _accountText.width;
        _passwordText.height = _accountText.height;
        _passwordText.y = _passwordLabel.y;
        _passwordText.x = _accountText.x;
        _passwordText.backgroundColor = MAColorWithStr(@"#ffffff");
        _passwordText.keyboardType = UIKeyboardTypeURL;
        _passwordText.delegate = self;
        
    }
    return _passwordText;
}

-(UIButton *)confirmBtn
{
    if(!_confirmBtn)
    {
        _confirmBtn = [[UIButton alloc] init];
        _confirmBtn.width = SCREEN_WIDTH / 4;
        _confirmBtn.height = 30;
        _confirmBtn.backgroundColor = [UIColor whiteColor];
        [_confirmBtn addTarget:self action:@selector(login)  forControlEvents:UIControlEventTouchUpInside];
        _confirmBtn.y = _passwordText.y + _passwordText.height +  60.f;
        _confirmBtn.centerX = SCREEN_WIDTH/2;
        [_confirmBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
    }
    return _confirmBtn;
    
}
-(instancetype)init
{
    if(self = [super init])
    {
        self.view.backgroundColor = [UIColor  blackColor];
        
        [self.view addSubview:self.accountLabel];
        [self.view addSubview:self.accountText];
        
        [self.view addSubview:self.passwordLabel];
        [self.view addSubview:self.passwordText];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturedAction:)];
        [self.view addGestureRecognizer:tap];
        tap.delegate = self;
        [self.view addSubview:self.confirmBtn];
        self.session = [Session sharedInstance];
        
        
        
    }
    return self;
}
- (void)viewDidLoad
{
    self.dataProvider =  [[SELoginDateProvider alloc] init];
    [super viewDidLoad];
   
}
//响应协议
-(void)tapGesturedAction:(UIGestureRecognizer *)gesture{
    
    [_accountText resignFirstResponder];
    [_accountText endEditing:YES];
    [_passwordText resignFirstResponder];
    [_passwordText endEditing:YES];
   
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_accountText resignFirstResponder];
    [_passwordText resignFirstResponder];
    return YES;
}
-(void)login
{
    WEAK_SELF;
    _accountText.text =@"97.64.110.91:2181";
    [(SELoginDateProvider *)self.dataProvider getLoginCodeWithAccount:_accountText.text
                                                              password:_passwordText.text
                                                               success:^{
                                                                   
                                                                   SessionDAO *dao = [[SessionDAO alloc] init];
                                                                   [dao ifNotExistsCreateTabele];
                                                                   weakSelf.session.account = _accountText.text;
                                                                   weakSelf.session.passWord = _passwordText.text;
                                                                   [dao insertSession:weakSelf.session];
                                                                   [weakSelf switchController];
                                                                 
                                                               }
                                                               failure:nil];
    

}
@end
