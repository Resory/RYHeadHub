//
//  RYHeadHub.m
//  dolabank
//
//  Created by Resory on 15/10/10.
//  Copyright © 2015年 github.com/resory. All rights reserved.
//

#import "RYHeadHub.h"

#define SYS_DEVICE_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define SYS_DEVICE_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度
#define RGBA(R,G,B,A)  [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A] //RGBA
#define GLOBAL_ANIMATION_DURATION 0.5f                                                  // 提示页面-显示,隐藏-动效时间

// iconfont设置
#define kFXIconFamilyName   @"iconfont"                                                 // icon字体
#define kFXIconFail         @"\U0000e611"                                               // 失败字体
#define kFXIconSuccess      @"\U0000e642"                                               // 成功字体

@interface RYHeadHub ()

@property (nonatomic, strong) UILabel *noteLb;                                          // 提示文字
@property (nonatomic, strong) UILabel *iconLb;                                          // icon字体

@end

@implementation RYHeadHub

// 单例
+ (instancetype)shareInstance
{
    static dispatch_once_t onces;
    static RYHeadHub *headHub;
    dispatch_once(&onces, ^{
        
        headHub = [[RYHeadHub alloc] initWithFrame:CGRectMake(0, -64, SYS_DEVICE_WIDTH, 64)];
        headHub.windowLevel = UIWindowLevelStatusBar;
        
        // 提示文字
        headHub.noteLb = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, SYS_DEVICE_WIDTH - 50, 44)];
        headHub.noteLb.textColor = [UIColor blackColor];
        headHub.noteLb.textAlignment = NSTextAlignmentLeft;
        headHub.noteLb.font = [UIFont systemFontOfSize:14.0];
        headHub.noteLb.numberOfLines = 0;
        
        // 字体icon
        headHub.iconLb = [[UILabel alloc] initWithFrame:CGRectMake(15, (64-15)/2.0, 15, 15)];
        headHub.iconLb.textColor = [UIColor blackColor];
        headHub.iconLb.textAlignment = NSTextAlignmentLeft;
        headHub.iconLb.font = [UIFont fontWithName:kFXIconFamilyName size:15.0];
        
        // 默认配置
        headHub.rSuccessBackgroundColor = RGBA(50, 205, 50, 1.0);
        headHub.rSucessTextColor = [UIColor whiteColor];
        headHub.rFailBackgroundColor = [UIColor redColor];
        headHub.rFailTextColor = [UIColor blackColor];
        headHub.rDurationTime = 2.0;
        headHub.rAnimationType = RYHeadHubTranslation;
        
        [headHub addSubview:headHub.iconLb];
        [headHub addSubview:headHub.noteLb];
        
    });
    
    return headHub;
}


#pragma mark -
#pragma mark - Setting

// 根据返回状态配置颜色
- (void)configViewStyleWithStaus:(RYHeadHubStatus)status andNoteText:(NSString *)text
{
    UIColor *noteLbColor = nil;
    UIColor *iconLbColor = nil;
    UIColor *backgroundColor = nil;
    NSString *iconText = nil;
    
    switch (status)
    {
        // 成功时配色
        case RYHeadHubShowSuccess:
        {
            noteLbColor = self.rSucessTextColor;
            iconLbColor = self.rSucessTextColor;
            backgroundColor = self.rSuccessBackgroundColor;
            iconText = kFXIconSuccess;
            break;
        }
         
        // 失败时配色
        case RYHeadHubShowFail:
        {
            noteLbColor = self.rFailTextColor;
            iconLbColor = self.rFailTextColor;
            backgroundColor = self.rFailBackgroundColor;
            iconText = kFXIconFail;
            
            break;
        }
        default:
            break;
    }
    
    // icon&提示文字&背景 颜色
    self.noteLb.textColor = noteLbColor;
    self.iconLb.textColor = iconLbColor;
    self.backgroundColor = backgroundColor;
    
    // icon&提示 文字
    self.noteLb.text = text;
    self.iconLb.text = iconText;
    
}

#pragma mark -
#pragma mark - Action

// 防止动效没完成前，再次调用。
static bool shouldShowHeadHub = YES;

- (void)showHeadHubWithStatus:(RYHeadHubStatus)status andNoteText:(NSString *)text;
{
    if(shouldShowHeadHub)
    {
        // 设置样式
        [self configViewStyleWithStaus:status andNoteText:text];
        // 显示提示框
        switch (self.rAnimationType) {
            case RYHeadhubRotation:
            {
                [self showWithRotateAnimation];
            }
                break;
            case RYHeadHubTranslation:
            {
                [self showWithTranslationAnimation];
            }
                break;
            default:
                break;
        }
    }
}


// 显示提示框
- (void)showWithTranslationAnimation
{
    self.frame = CGRectMake(0, -64, SYS_DEVICE_WIDTH, 64);
    __block CGRect tFrame = self.frame;
    tFrame.origin.y = 0;

    [UIView animateWithDuration:GLOBAL_ANIMATION_DURATION animations:^{
        
        // 显示
        self.frame = tFrame;
        [self makeKeyAndVisible];
        shouldShowHeadHub = NO;
        
    } completion:^(BOOL finished) {
        
        // 隐藏
        if(finished)
        {
            tFrame.origin.y = -64;
            [UIView animateWithDuration:GLOBAL_ANIMATION_DURATION
                                  delay:self.rDurationTime
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                
                self.frame = tFrame;
                
            } completion:^(BOOL finished){
            
                if(finished)
                    [self hideNoteHub];
            }];
        }
        
    }];
}

// 隐藏提示框
- (void)hideNoteHub
{
    [self setHidden:YES];
    shouldShowHeadHub = YES;
    self.layer.transform = CATransform3DIdentity;
}

// 其他动效
- (void)showWithRotateAnimation
{
    self.frame = CGRectMake(0, 0, SYS_DEVICE_WIDTH, 64);
    self.layer.transform = CATransform3DMakeRotation(-M_PI_2, 1, 0, 0);
    
    [UIView animateWithDuration:GLOBAL_ANIMATION_DURATION
                          delay:0
         usingSpringWithDamping:0.9
          initialSpringVelocity:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
        
        CATransform3D transform = CATransform3DIdentity;
        self.layer.transform = transform;
        [self makeKeyAndVisible];
        shouldShowHeadHub = NO;
        
    } completion:^(BOOL finished) {
        
        if(finished)
        {
            [UIView animateWithDuration:GLOBAL_ANIMATION_DURATION
                                  delay:self.rDurationTime
                                options:UIViewAnimationOptionAllowUserInteraction
                             animations:^{
                
                 self.layer.transform = CATransform3DMakeRotation(-M_PI_2, 1, 0, 0);
                                 
            } completion:^(BOOL finished) {
                
                if(finished)
                {
                    [self hideNoteHub];
                }
                
            }];
        }
        
    }];
            
    
}


@end
