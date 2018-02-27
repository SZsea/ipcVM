//
//  SERedeemView.h
//  ipcVM
//
//  Created by Sean on 2018/1/5.
//  Copyright © 2018年 Sean. All rights reserved.
//



@interface SECustomView : UIView

typedef NS_ENUM(NSInteger, SECustomViewStyle) {
    SECustomViewRedeem,
    SECustomViewRedeemT,
    SECustomViewCDKey,
    SECustomViewAddlicense,
    SECustomViewStart,
    SECustomViewStop,
    SECustomViewPause,
    SECustomViewPauseSconds,
    SECustomViewResume,
    SECustomView2fa,
    SECustomView2faok,
    SECustomViewScond,
    
};

@property(nonatomic,assign)SECustomViewStyle  style;

-(instancetype)initWithstyle:(SECustomViewStyle)style;

-(instancetype)initWithstyle:(SECustomViewStyle)style withExtraString:(NSString *)str;

-(instancetype)initWithExtraString:(NSString *)str cancelButton:(void(^)())cancelBlock sureButton:(void(^)())sureBlock;

-(void)p_setextraStr:(NSString *)str;

- (void)showAnimation;

- (void)setRightBtnblock:(void (^)(NSString *modes))rightBtnblock;
@end
