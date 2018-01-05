//
//  SERedeemView.m
//  ipcVM
//
//  Created by Sean on 2018/1/5.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SECustomView.h"
@interface SECustomView()
@property(nonatomic,strong)UIView    *customView;

@property(nonatomic,strong)UIView    *backView;

@property(nonatomic,strong)UIButton  *enSureBtn;

@property(nonatomic,strong)UIButton  *cancelBtn;

@property(nonatomic,strong)UITextField *extralText;


@end
@implementation SECustomView
-(UITextField *)extralText
{
    if (!_extralText) {
        
        _extralText = [[UITextField alloc] init];
        
        
    }
    return _extralText;

}
-(UIView *)customView
{
   if(!_customView)
   {
       _customView = [[UIView alloc] init];
       _customView.size = CGSizeMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
       _customView.centerX = SCREEN_WIDTH/2;
       _customView.centerY = SCREEN_HEIGHT/2;
       _customView.backgroundColor = [UIColor whiteColor];
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
        
    }
    return _cancelBtn;
    
}

-(instancetype)initWithModeRedeem
{
    if(self = [super init])
    {
        [self addSubview:self.backView];
        [self addSubview:self.customView];

        
        
    }
    return self;
  
}

@end
