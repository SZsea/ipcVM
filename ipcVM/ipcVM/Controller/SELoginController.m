//
//  SELoginController.m
//  ipcVM
//
//  Created by Sean on 2017/12/27.
//  Copyright © 2017年 Sean. All rights reserved.
//

#import "SELoginController.h"
#import "SELoginDateProvider.h"
@interface SELoginController ()<UIGestureRecognizerDelegate,UITextFieldDelegate>

@property(nonatomic,strong) UILabel       *accountLabel;

@property(nonatomic,strong) UITextField   *accountText;


@property(nonatomic,strong) UIButton     *confirmBtn;
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

-(UIButton *)confirmBtn
{
    if(!_confirmBtn)
    {
        _confirmBtn = [[UIButton alloc] init];
        _confirmBtn.width = SCREEN_WIDTH / 4;
        _confirmBtn.height = 40;
        _confirmBtn.backgroundColor = [UIColor whiteColor];
        [_confirmBtn addTarget:self action:@selector(login)  forControlEvents:UIControlEventTouchUpInside];
        _confirmBtn.y = _accountText.y + _accountText.height +  24.f;
        _confirmBtn.centerX = SCREEN_WIDTH/2;
        
        
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
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturedAction:)];
        [self.view addGestureRecognizer:tap];
        tap.delegate = self;
        [self.view addSubview:self.confirmBtn];
        
        
        
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
//    [_suggestionField resignFirstResponder];
//    [_suggestionField endEditing:YES];
   
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_accountText resignFirstResponder];
    return YES;
}
-(void)login
{
     [(SELoginDateProvider *)self.dataProvider getLoginCodeWithAccount:_accountText.text password:nil];
 
}
@end
