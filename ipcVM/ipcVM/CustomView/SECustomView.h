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
    SECustomViewResume,
    SECustomView2fa,
    SECustomView2faok,
    
};

@property(nonatomic,assign)SECustomViewStyle  style;

-(instancetype)initWithstyle:(SECustomViewStyle)style;


- (void)showAnimation;

- (void)setRightBtnblock:(void (^)(NSString *modes))rightBtnblock;
@end
