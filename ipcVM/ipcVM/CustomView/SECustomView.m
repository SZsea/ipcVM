//
//  SERedeemView.m
//  ipcVM
//
//  Created by Sean on 2018/1/5.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SECustomView.h"
@interface SECustomView()<UIGestureRecognizerDelegate,UITextFieldDelegate>
@property(nonatomic,strong)UIView    *customView;

@property(nonatomic,strong)UIView    *backView;

@property(nonatomic,strong)UIButton  *enSureBtn;

@property(nonatomic,strong)UIButton  *cancelBtn;

@property(nonatomic,strong)UILabel   *customTitle;

@property(nonatomic,strong)UITextField *extralText;

@property(nonatomic,strong)UILabel   *sighTitle;

@property (nonatomic, copy)   void(^customblock)(NSString *);

@end
@implementation SECustomView
-(UILabel *)sighTitle
{
    if(!_sighTitle)
    {
        _sighTitle = [[UILabel alloc] init];
        _sighTitle.width = _extralText.width;
        _sighTitle.height = _customView.height - _cancelBtn.height - (_extralText.y + _extralText.height) - 8.f;
        _sighTitle.font = MANUIFontWithSize(14.f);
        
        switch (_style) {
            case SECustomViewRedeemT:
            {
                 NSString *text = @"(参数可为空)也可多项 例：FF,SI\n参数列表&参数说明\nFD\nForces Distributing redeeming preference to be enabled\nFF\nForces Forwarding redeeming preference to be enabled\nFKMG\nForces KeepMissingGames redeeming preference to be enabled\nSD\nForces Distributing redeeming preference to be disabled\nSF\nForces Forwarding redeeming preference to be disabled\nSI\nSkipInitial  Skips key redemption on initial bot\nSKMG\nForces KeepMissingGames redeeming preference to be disabled\nV\nValidates keys for proper format and automatically skips invalid ones";
                
                NSRange rangeFD = [text rangeOfString:@"\nFD\n"];
                NSRange rangeFF = [text rangeOfString:@"\nFF\n"];
                NSRange rangeFKMG = [text rangeOfString:@"\nFKMG\n"];
                NSRange rangeSD = [text rangeOfString:@"\nSD\n"];
                NSRange rangeSF = [text rangeOfString:@"\nSF\n"];
                NSRange rangeSI = [text rangeOfString:@"\nSI\n"];
                NSRange rangeSKMG = [text rangeOfString:@"\nSKMG\n"];
                NSRange rangeV = [text rangeOfString:@"\nV\n"];
                NSRange rangelizi = NSMakeRange(14, 5);
                
                NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:text];
                
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:MAColorWithStr(@"#EE0000") range:rangeFD];
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:MAColorWithStr(@"#EE0000") range:rangeFF];
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:MAColorWithStr(@"#EE0000") range:rangeFKMG];
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:MAColorWithStr(@"#EE0000") range:rangeSD];
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:MAColorWithStr(@"#EE0000") range:rangeSF];
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:MAColorWithStr(@"#EE0000") range:rangeSI];
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:MAColorWithStr(@"#EE0000") range:rangeSKMG];
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:MAColorWithStr(@"#EE0000") range:rangeV];
                [AttributedStr addAttribute:NSForegroundColorAttributeName value:MAColorWithStr(@"#EE0000") range:rangelizi];
                _sighTitle.attributedText = AttributedStr;
            }
                break;
                
            default:
                break;
        }
        

        _sighTitle.textAlignment = NSTextAlignmentLeft;
        _sighTitle.numberOfLines = 0;
        _sighTitle.y = _extralText.y + _extralText.height + 8.f;
        _sighTitle.centerX = _customView.width/2;
        _sighTitle.backgroundColor = MAColorWithStr(@"#DEDEDE");
    }
    return _sighTitle;
 
}



-(UILabel *)customTitle
{
    if(!_customTitle)
    {
        _customTitle = [[UILabel alloc] init];
        _customTitle.y = 16.f;
        
        
    }
    return _customTitle;
    
}

-(UITextField *)extralText
{
    if (!_extralText) {
        
        _extralText = [[UITextField alloc] init];
        _extralText.width = _customView.width - 16;
        _extralText.height = 32.f;
        _extralText.centerX = _customView.width/2;
        _extralText.y = _customTitle.y + 24.f;
        _extralText.backgroundColor = MAColorWithStr(@"#EEEEE0");
        _extralText.keyboardType = UIKeyboardTypeASCIICapable;
        _extralText.delegate = self;

    }
    return _extralText;

}
-(UIView *)customView
{
   if(!_customView)
   {
       _customView = [[UIView alloc] init];
       _customView.width = SCREEN_WIDTH - 64;
       
       switch (_style) {
           case SECustomViewRedeemT:
           {
               _customView.height = SCREEN_HEIGHT/3*2 + 100.f;
               
           }
               break;
               
           default:
               break;
       }
       _customView.centerX = SCREEN_WIDTH/2;
//       _customView.centerY = SCREEN_HEIGHT/2;
       _customView.y = SCREEN_HEIGHT;
       _customView.backgroundColor = MAColorWithStr(@"#DEDEDE");
       _customView.layer.cornerRadius = 10.f;
       _customView.layer.masksToBounds = YES;
       [_customView addSubview:self.customTitle];
       [_customView addSubview:self.enSureBtn];
       [_customView addSubview:self.cancelBtn];
       [_customView addSubview:self.extralText];
       [_customView addSubview:self.sighTitle];
   }
    return _customView;
    
}
-(UIView *)backView
{
    if(!_backView)
    {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _backView.backgroundColor = [UIColor blackColor];
        _backView.alpha = 0.35;
        
    }
    return _backView;
    
    
}
-(UIButton *)enSureBtn
{
    if(!_enSureBtn)
    {
        _enSureBtn = [[UIButton alloc] init];
        [_enSureBtn setTitle:@"确认" forState:UIControlStateNormal];
        [_enSureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _enSureBtn.size = CGSizeMake(_customView.width/2, 40.f);
        _enSureBtn.x = 0;
        _enSureBtn.y = _customView.height - _enSureBtn.height;
        _enSureBtn.backgroundColor = MAColorWithStr(@"#EE7942");

        [_enSureBtn addTarget:self action:@selector(enSureAct) forControlEvents:UIControlEventTouchDown];
        
    }
    return _enSureBtn;
    
}

-(UIButton *)cancelBtn
{
    if(!_cancelBtn)
    {
        _cancelBtn = [[UIButton alloc] init];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancelBtn.size = CGSizeMake(_customView.width/2, 40.f);
        _cancelBtn.x = _enSureBtn.x + _enSureBtn.width;
        _cancelBtn.y = _enSureBtn.y;
        _cancelBtn.backgroundColor = MAColorWithStr(@"#1E90FF");
 
        [_cancelBtn addTarget:self action:@selector(cancelView) forControlEvents:UIControlEventTouchDown];
        
    }
    return _cancelBtn;
    
}

-(instancetype)initWithTitle:(NSString *)title
{
    if(self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)])
    {
        
        [self addSubview:self.backView];
        [self addSubview:self.customView];
        ;
        self.customTitle.text = [title stringByAppendingString:@"额外参数"];
        [self.customTitle sizeToFit];
        self.customTitle.centerX = _customView.width/2;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturedAction:)];
        [self addGestureRecognizer:tap];
        tap.delegate = self;
    

        
        
    }
    return self;
  
}

- (void)showAnimation
{
    [UIView animateWithDuration:0.5f
                     animations:^{
                        
                        _customView.centerY = SCREEN_HEIGHT/2;
        
    }
                     completion:^(BOOL finished) {
                         
                       _customView.centerY = SCREEN_HEIGHT/2;
        
    }];
    
    
    
    
}



-(void)cancelView
{
    [UIView animateWithDuration:0.5f
                     animations:^{
                         
                         _customView.y = SCREEN_HEIGHT;
                         
                     }
                     completion:^(BOOL finished) {
                         
                         _customView.y = SCREEN_HEIGHT;
                         [self removeFromSuperview];
                         
                     }];
    
}
- (void)setRightBtnblock:(void (^)(NSString *modes))rightBtnblock
{
    
    _customblock = rightBtnblock;
    
}
-(void)enSureAct
{
    if(_customblock)
    {
        _customblock(_extralText.text);
    }
}


-(void)tapGesturedAction:(UIGestureRecognizer *)gesture{
    
    [_extralText resignFirstResponder];
    [_extralText endEditing:YES];
    [_extralText resignFirstResponder];
    [_extralText endEditing:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_extralText resignFirstResponder];
    [_extralText resignFirstResponder];
    return YES;
}
@end