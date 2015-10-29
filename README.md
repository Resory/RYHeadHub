# RYHeadHub

类似QQ音乐头部提示View

# 效果

![RYHeadHub](https://github.com/Resory/Images/blob/master/RYHeadHub.gif)

# 如何使用

1.引用文件<br>
``` objc
#import "RYHeadhub.h"
```
  
2.调用方法<br>
``` objc
[[RYHeadHub shareInstance] showHeadHubWithStatus:RYHeadHubShowSuccess andNoteText:@"数据刷新成功!"]
```
``` objc
[[RYHeadHub shareInstance] showHeadHubWithStatus:RYHeadHubShowFail andNoteText:@"数据下载失败!"]
```

3.自定义部分(修改不同状态下的颜色,动效,动效持续时间等)
``` objc
typedef NS_ENUM(NSUInteger, RYHeadHubAniamtionType) {
    RYHeadHubTranslation,        // 平移动效
    RYHeadhubRotation,           // 旋转动效
};


typedef NS_ENUM(NSUInteger, RYHeadHubStatus) {
    RYHeadHubShowSuccess = 0,   // 成功
    RYHeadHubShowFail    = 1,   // 失败
};


@interface RYHeadHub : UIWindow

@property (nonatomic, strong) UIColor *rSucessTextColor;               // 成功-提示文字,icon-颜色
@property (nonatomic ,strong) UIColor *rSuccessBackgroundColor;        // 成功-背景-颜色

@property (nonatomic, strong) UIColor *rFailTextColor;                 // 失败-提示文字,icon-颜色
@property (nonatomic, strong) UIColor *rFailBackgroundColor;           // 失败-背景-颜色

@property (nonatomic, assign) CGFloat rDurationTime;                   // 提示页面-出现-持续时间
@property (nonatomic, assign) RYHeadHubAniamtionType rAnimationType;   // 提示页面-动效-默认为RYHeadHubTranslationY

```

# 小贴士
提示页面的图标是[iconfont](http://ued.taobao.org/blog/2013/09/icon-font-in-ios/ "关于iconfont") . Demo带了一套iconfont.如需修改,需自己准备iconfont.<br>
