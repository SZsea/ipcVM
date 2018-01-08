//
//  MAProgressHUD.m
//  MicroAnswer
//
//  Created by joe on 16/8/15.
//
//

#import "MAProgressHUD.h"
#import "SVProgressHUD.h"

@implementation MAProgressHUD

+ (void)initialize{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setCornerRadius:10];
}

+ (void)show{
    [SVProgressHUD show];
}

+ (void)showWithTxt:(NSString *)txt{
    [SVProgressHUD showWithStatus:txt];
}

+ (void)showInfoWithTxt:(NSString *)txt{
    [SVProgressHUD showInfoWithStatus:txt];
}

+ (void)showErrorWithTxt:(NSString *)txt{
    [SVProgressHUD showErrorWithStatus:txt];
}

+ (void)showSuccessWithTxt:(NSString *)txt{
    [SVProgressHUD showSuccessWithStatus:txt];
}

+ (void)showImage:(UIImage *)image txt:(NSString *)txt{
    [SVProgressHUD showImage:image status:txt];
}

+ (void)showProgress:(float)progress{
    [SVProgressHUD showProgress:progress];
}

+ (void)showProgress:(float)progress txt:(NSString *)txt{
    [SVProgressHUD showProgress:progress status:txt];
}

+ (void)dismiss{
    [SVProgressHUD dismiss];
}

+ (void)dismissWithDelay:(NSTimeInterval)delay{
    [SVProgressHUD dismissWithDelay:delay];
}

@end
