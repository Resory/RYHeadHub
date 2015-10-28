//
//  RYHeadHub.h
//  dolabank
//
//  Created by Resory on 15/10/10.
//  Copyright © 2015年 github.com/resory. All rights reserved.
//

#import <UIKit/UIKit.h>


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

/**
 *  单例
 *
 *  @return 单例
 */
+ (instancetype)shareInstance;

/**
 *  显示提示页面
 *
 *  @param status 提示状态
 *  @param text   提示文字
 */
- (void)showHeadHubWithStatus:(RYHeadHubStatus)status andNoteText:(NSString *)text;


@end
