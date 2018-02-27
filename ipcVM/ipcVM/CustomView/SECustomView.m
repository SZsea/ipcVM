//
//  SERedeemView.m
//  ipcVM
//
//  Created by Sean on 2018/1/5.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SECustomView.h"
@interface SECustomView()<UIGestureRecognizerDelegate,UITextFieldDelegate,UITextViewDelegate>
@property(nonatomic,strong)UIView    *customView;

@property(nonatomic,strong)UIView    *backView;

@property(nonatomic,strong)UIButton  *enSureBtn;

@property(nonatomic,strong)UIButton  *cancelBtn;

@property(nonatomic,strong)UILabel   *customTitle;

@property(nonatomic,strong)UITextField *extralText;

@property(nonatomic,strong)UILabel   *sighTitle;

@property(nonatomic,strong)NSString  *finalStr;

@property(nonatomic,strong)UITextView  *cdkeyText;

@property (nonatomic, copy)   void(^customblock)(NSString *);

@property (nonatomic, copy)   void(^cancelBlock)();

@property (nonatomic, copy)   void(^ensureBlock)();

@property(nonatomic,strong) NSString  *extraStr;

@end
@implementation SECustomView
-(UITextView *)cdkeyText
{
    if(!_cdkeyText)
    {
        _cdkeyText = [[UITextView alloc] init];
        _cdkeyText.backgroundColor = MAColorWithStr(@"#EEEEE0");
        _cdkeyText.textAlignment = NSTextAlignmentLeft;
        _cdkeyText.keyboardType = UIKeyboardTypeDefault;
        _cdkeyText.size = CGSizeMake(_customView.width - 16, _customView.height - 40.f - _sighTitle.height - (_customTitle.y + _customTitle.height) - 32.f);
        _cdkeyText.delegate = self;
        _cdkeyText.centerX = _customView.width/2;
        _cdkeyText.y = _sighTitle.y + _sighTitle.height + 8.f;
    }
    return _cdkeyText;
}
-(NSString *)finalStr
{
    if(!_finalStr)
    {
        _finalStr = [NSString new];
    }
    return _finalStr;
    
    
}
-(UILabel *)sighTitle
{
    if(!_sighTitle)
    {
        _sighTitle = [[UILabel alloc] init];
        

        
        _sighTitle.font = MANUIFontWithSize(14.f);
        _sighTitle.textAlignment = NSTextAlignmentLeft;
        _sighTitle.numberOfLines = 0;
        switch (_style) {
            case SECustomViewRedeemT:
            {
                _sighTitle.width = _extralText.width;
                _sighTitle.height = _customView.height - 40.f - (_extralText.y + _extralText.height) - 8.f;
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
                _sighTitle.y = _extralText.y + _extralText.height + 8.f;
            }
                break;
            case SECustomViewCDKey: case SECustomViewRedeem:
            {
                _sighTitle.width = _customView.width - 16;
                _sighTitle.height = 64.f;
                NSString *text = @"可输入多组Cdkey,并且以"",""的方式隔开例如:key1,key2,key3\n请不要输入不必要的字符";
                NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:text];
                _sighTitle.attributedText = AttributedStr;
                _sighTitle.y = _customTitle.y + _customTitle.height + 8.f;
            }
            case SECustomViewAddlicense:
            {
                _sighTitle.width = _customView.width - 16;
                _sighTitle.height = 64.f;
                NSString *text = @"可输入多组appIDs/subIDs,并且以"",""的方式隔开例如:key1,key2,key3\n请不要输入不必要的字符";
                NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:text];
                _sighTitle.attributedText = AttributedStr;
                _sighTitle.y = _customTitle.y + _customTitle.height + 8.f;
            }
                break;
            case SECustomViewPauseSconds:
            {
                _sighTitle.width = _customView.width - 16;
                _sighTitle.height = 84.f;
                NSString *text = @"输入多组Sconds,并且以"",""的方式隔开例如:key1,key2,key3\n请不要输入不必要的字符\n可以为空";
                text = [text stringByAppendingFormat:@"\n当前所选bot:%@",_extraStr];
                NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:text];
                _sighTitle.attributedText = AttributedStr;
                _sighTitle.y = _customTitle.y + _customTitle.height + 8.f;
            }
                break;
            case SECustomViewScond:
            {

                _sighTitle.text = self.extraStr;
                _sighTitle.font = MANUIFontWithSize(20.f);
                [_sighTitle sizeToFit];
                _sighTitle.y = _customTitle.y + _customTitle.height + 8.f;
                
            }
                break;
            default:
                break;
        }
        
        _sighTitle.centerX = _customView.width/2;
        _sighTitle.backgroundColor = MAColorWithStr(@"#DEDEDE");
//        _sighTitle.backgroundColor = [UIColor redColor];
    }
    return _sighTitle;
 
}



-(UILabel *)customTitle
{
    if(!_customTitle)
    {
        _customTitle = [[UILabel alloc] init];
        _customTitle.y = 16.f;
        switch (_style) {
            case SECustomViewRedeemT:
                self.customTitle.text = @"redeem^额外参数";
                [self.customTitle sizeToFit];
                self.customTitle.centerX = _customView.width/2;
                break;
            case SECustomViewCDKey: case SECustomViewRedeem:
                self.customTitle.text = @"CDKey";
                [self.customTitle sizeToFit];
                self.customTitle.centerX = _customView.width/2;
                break;
             case SECustomViewAddlicense:
                self.customTitle.text = @"addlicense";
                [self.customTitle sizeToFit];
                self.customTitle.centerX = _customView.width/2;
                break;
            case SECustomViewPauseSconds:
                self.customTitle.text = @"PauseSconds";
                [self.customTitle sizeToFit];
                self.customTitle.centerX = _customView.width/2;
                break;
            case SECustomViewScond:
                self.customTitle.text = @"删除确认";
                [self.customTitle sizeToFit];
                self.customTitle.centerX = _customView.width/2;
                break;
            default:
                break;
        }
        
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
               _customView.height = SCREEN_HEIGHT - 64.f;
               _customView.centerX = SCREEN_WIDTH/2;
               //       _customView.centerY = SCREEN_HEIGHT/2;
               _customView.y = SCREEN_HEIGHT;
               _customView.backgroundColor = MAColorWithStr(@"#DEDEDE");
               _customView.layer.cornerRadius = 10.f;
               _customView.layer.masksToBounds = YES;
               [_customView addSubview:self.customTitle];

               [_customView addSubview:self.extralText];
               [_customView addSubview:self.sighTitle];
               
           }
               break;
           case SECustomViewCDKey:  case SECustomViewRedeem: case SECustomViewAddlicense: case SECustomViewPauseSconds:
           {
               _customView.height = SCREEN_HEIGHT /2;
               _customView.centerX = SCREEN_WIDTH/2;
               //       _customView.centerY = SCREEN_HEIGHT/2;
               _customView.y = SCREEN_HEIGHT;
               _customView.backgroundColor = MAColorWithStr(@"#DEDEDE");
               _customView.layer.cornerRadius = 10.f;
               _customView.layer.masksToBounds = YES;
               [_customView addSubview:self.customTitle];
               [_customView addSubview:self.sighTitle];
               [_customView addSubview:self.cdkeyText];
               
           }
        
               break;
           case SECustomViewScond:
           {
               _customView.height = SCREEN_HEIGHT /2;
               _customView.centerX = SCREEN_WIDTH/2;
               //       _customView.centerY = SCREEN_HEIGHT/2;
               _customView.y = SCREEN_HEIGHT;
               _customView.backgroundColor = MAColorWithStr(@"#DEDEDE");
               _customView.layer.cornerRadius = 10.f;
               _customView.layer.masksToBounds = YES;
               [_customView addSubview:self.customTitle];
               [_customView addSubview:self.sighTitle];
           }
               break;
           default:
               break;
       }
       [_customView addSubview:self.enSureBtn];
       [_customView addSubview:self.cancelBtn];


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

-(instancetype)initWithstyle:(SECustomViewStyle)style
{
    if(self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)])
    {

        _style = style;
        [self addSubview:self.backView];
        [self addSubview:self.customView];

        switch (_style) {
            case SECustomViewRedeemT:
            {
                     
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturedAction:)];
                [self addGestureRecognizer:tap];
                tap.delegate = self;
             }
                break;
            case SECustomViewCDKey: case SECustomViewRedeem: case SECustomViewAddlicense:case SECustomViewPauseSconds:
            {

                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturedAction:)];
                [self addGestureRecognizer:tap];
                tap.delegate = self;
                
                
            }
                break;
            default:
                break;
        }
        
    }
    return self;
  
}
-(instancetype)initWithstyle:(SECustomViewStyle)style withExtraString:(NSString *)str
{
    if(self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)])
    {
        self.extraStr = str;
        self = [self initWithstyle:style];
        
    }
    return self;
}

-(instancetype)initWithExtraString:(NSString *)str cancelButton:(void(^)())cancelBlock sureButton:(void(^)())sureBlock
{
    
    if(self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)])
    {
        self.extraStr = str;
        _cancelBlock = cancelBlock;
        _ensureBlock = sureBlock;
        self = [self initWithstyle:SECustomViewScond];

        
    }
    return self;
  
}
-(void)p_setextraStr:(NSString *)str
{
    self.extraStr = str;
    _sighTitle.width = _customView.width - 16;
    _sighTitle.height = 84.f;
    NSString *text = @"输入多组Sconds,并且以"",""的方式隔开例如:key1,key2,key3\n请不要输入不必要的字符\n可以为空";
    text = [text stringByAppendingFormat:@"\n当前所选bot:%@",_extraStr];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:text];
    _sighTitle.attributedText = AttributedStr;
    _sighTitle.y = _customTitle.y + _customTitle.height + 8.f;
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
    switch (_style) {
        case SECustomViewCDKey: case SECustomViewRedeem: case SECustomViewAddlicense: case SECustomViewPauseSconds:
            self.finalStr = _cdkeyText.text;
            break;
        case SECustomViewRedeemT:
            self.finalStr = _extralText.text;
            break;
            
        default:
            break;
    }
    

    
    if(_customblock)
    {
        _customblock(self.finalStr);
    }
    if(_ensureBlock)
    {
        _ensureBlock();
    }
    [self cancelView];
}


-(void)tapGesturedAction:(UIGestureRecognizer *)gesture{
    if(_extralText)
    {
        [_extralText resignFirstResponder];
        [_extralText endEditing:YES];
    }
    if(_cdkeyText)
    {
        [_cdkeyText resignFirstResponder];
        [_cdkeyText endEditing:YES];
    }

    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_extralText resignFirstResponder];
    [_extralText resignFirstResponder];
    return YES;
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [_cdkeyText resignFirstResponder];
    [_cdkeyText endEditing:YES];

    
    
}
@end
