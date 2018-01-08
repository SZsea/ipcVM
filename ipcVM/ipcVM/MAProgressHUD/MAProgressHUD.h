//
//  MAProgressHUD.h
//  MicroAnswer
//
//  Created by joe on 16/8/15.
//
//


@interface MAProgressHUD : UIView

/**
 *  无文字的加载
 */
+ (void)show;

//+ (void)showToView:(UIView *)view;

/**
 *  有文字的加载
 */
+ (void)showWithTxt:(NSString *)txt;

//+ (void)showWithTxt:(NSString *)txt toView:(UIView *)view;


/**
 *  提示
 */
+ (void)showInfoWithTxt:(NSString *)txt;

//+ (void)showInfoWithTxt:(NSString *)txt toView:(UIView *)view;

/**
 *  错误
 */
+ (void)showErrorWithTxt:(NSString *)txt;

//+ (void)showErrorWithTxt:(NSString *)txt toView:(UIView *)view;

/**
 *  成功
 */
+ (void)showSuccessWithTxt:(NSString*)txt;

//+ (void)showSuccessWithTxt:(NSString *)txt toView:(UIView *)view;


/**
 *  图片
 */
+ (void)showImage:(UIImage*)image txt:(NSString*)txt;

//+ (void)showImage:(UIImage*)image txt:(NSString*)txt toView:(UIView *)view;

/**
 *  进度条
 */
+ (void)showProgress:(float)progress;

//+ (void)showProgress:(float)progress toView:(UIView *)view;

/**
 *  进度条加文字
 */
+ (void)showProgress:(float)progress txt:(NSString*)txt;

/**
 *  消失
 */

+ (void)dismiss;

+ (void)dismissWithDelay:(NSTimeInterval)delay;

@end
