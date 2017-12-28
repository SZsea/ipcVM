//
//  MASingletonTemplate.h
//  MicroAnswer
//
//  Created by joe on 16/7/25.
//
// 一些模板
//

#ifndef MASingletonTemplate_h
#define MASingletonTemplate_h


/** 描述 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define IS_IPHONE_6P ((SCREEN_HEIGHT * SCREEN_WIDTH == 414*736)? YES : NO)
#define IS_IPHONE_6 ((SCREEN_HEIGHT * SCREEN_WIDTH == 375*667)? YES : NO)
#define IS_IPHONE_5 ((SCREEN_HEIGHT * SCREEN_WIDTH == 320*568)? YES : NO)
#define IS_IPHONE_4 ((SCREEN_HEIGHT * SCREEN_WIDTH == 320*480)? YES : NO)
#define IS_BEFORE_6 (SCREEN_WIDTH < 375 ? YES:NO)

#define MinX(v)            CGRectGetMinX((v).frame) // 获得控件屏幕的x坐标
#define MinY(v)            CGRectGetMinY((v).frame) // 获得控件屏幕的Y坐标

#define MidX(v)            CGRectGetMidX((v).frame) //横坐标加上到控件中点坐标
#define MidY(v)            CGRectGetMidY((v).frame) //纵坐标加上到控件中点坐标

#define MaxX(v)            CGRectGetMaxX((v).frame) //横坐标加上控件的宽度
#define MaxY(v)            CGRectGetMaxY((v).frame) //纵坐标加上控件的高度

//static inline float lengthFit(float value)
//{
//     if (iPhone5AndEarlyDevice) {
//        return value *320.0f/414.0f;
//    }
//    if (Iphone6) {
//        return value *375.0f/414.0f;
//    }
//    return value;
//}

static inline float lengthFit(float value)
{
    if (IS_IPHONE_6P) {
        return (value/414.0f * SCREEN_WIDTH);
    }else{
        return (value/375.0f * SCREEN_WIDTH);
    }

}

#define MANotifiCenter [NSNotificationCenter defaultCenter]
#define MAUserDefaults  [NSUserDefaults standardUserDefaults]
#define MAImageWithName(name)  [UIImage imageNamed:name]
#define MAColorWithStr(str) [UIColor colorWithHexString:str]
#define MANFontWithSize(csize)  [MAFont systemFontOfSize:csize]
#define MABFontWithSize(csize)  [MAFont boldSystemFontOfSize:csize]
#define MANUIFontWithSize(csize)  [UIFont systemFontOfSize:csize]
#define MABUIFontWithSize(csize)  [UIFont boldSystemFontOfSize:csize]
#define IS7VERSION [UIDevice currentDevice].systemVersion.floatValue >= 7.0 // 判断是否ios7以上

#define GETREALWIDTH(width) lengthFit(width)
#define GETREALPerWIDTH(value) (value/375.0f * SCREEN_WIDTH)

#define KEYWINDOW  [UIApplication sharedApplication].keyWindow

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0
#define OUTERWINDOW KEYWINDOW
#else
#define OUTERWINDOW [[UIApplication sharedApplication].windows lastObject]
#endif

//打印#ifdef
#ifdef DEBUG
#define MALog(...)  NSLog(__VA_ARGS__)
#else
#define MALog(...)
#endif

//循环问题
#if __has_feature(objc_arc)
 #define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#else
#define WS(weakSelf)   __block __typeof(&*self)weakSelf = self;
#endif


#define DEGREES_TO_RADIANS(degree) ((degree)/180.0*M_PI)

#define WEAK_SELF   __weak typeof(self) weakSelf = self
#define STRONG_SELF if (!weakSelf) return; \
                    __strong typeof(weakSelf) strongSelf = weakSelf

// 防止内存泄露警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#define SAFE_SEND_MESSAGE(obj, msg) if ((obj) && [(obj) respondsToSelector:@selector(msg)])

/** release_obj */
#if __has_feature(objc_arc) // ARC
#define RELEASE_OBJECT(object) { if(nil != object) { object = nil; } }
#else // MRC
#define RELEASE_OBJECT(object) do{ if(nil != object) { [object release]; object = nil;}}while(0)
#endif

#ifndef   strongify
#if __has_feature(objc_arc)

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop")

#else

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __block_##x##__; \
_Pragma("clang diagnostic pop")

#endif
#endif
//autorelease

/** 系统提示 */

#if __has_feature(objc_arc)
#define WQAlertShow(messageText,buttonName) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:(messageText) \
delegate:nil cancelButtonTitle:(buttonName) otherButtonTitles: nil];\
[alert show];
#else
#define WQMAlertShow(messageText,buttonName) \
UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"提示" message:(messageText) \
delegate:nil cancelButtonTitle:(buttonName) otherButtonTitles: nil] autorelease];\
[alert show];
#endif


/** 类型判断 */
#define MA_IsKindOfNSDictionaryClass(instance) [instance isKindOfClass:[NSDictionary class]]
#define MA_IsKindOfNSArrayClass(instance) [instance isKindOfClass:[NSArray class]]
#define MA_IsObjKindOfClass(obj, class) (nil != obj && [obj isKindOfClass:class])
#define MA_PurifyArray(instance) (instance && MA_IsObjKindOfClass(instance, [NSArray class]) && instance.count > 0)


/** 单例 */
#define SINGLETON_DECLARATION  \
+ (instancetype)sharedInstance;

#define SINGLETON_MANAGER_DECLARATION  \
+ (instancetype)sharedManager;


#define SINGLETON_IMPLEMENT_FOR_CLASS(class) \
+ (instancetype)sharedInstance \
{ \
static id instance = nil; \
static dispatch_once_t predicate; \
dispatch_once(&predicate, ^{ \
instance = [[class alloc] init]; \
}); \
return instance; \
} \

#define CREATE_SHARED_MANAGER(CLASS_NAME) \
+ (instancetype)sharedManager { \
static CLASS_NAME *_instance; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[CLASS_NAME alloc] init]; \
}); \
\
return _instance; \
}


/** GCD */
#define MA_MainQueue  dispatch_get_main_queue()
#define MA_GlobalQueue  dispatch_get_global_queue(0, 0)

#endif /* MASingletonTemplate_h */
