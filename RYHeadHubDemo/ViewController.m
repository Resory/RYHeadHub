//
//  ViewController.m
//  RYHeadHubDemo
//
//  Created by Resory on 15/10/27.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import "ViewController.h"
#import "RYHeadhub.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 显示成功-字体模式
- (IBAction)successIconFontBtnAction:(id)sender
{
    RYHeadHub *headHub = [RYHeadHub shareInstance];
    [headHub showHeadHubWithStatus:RYHeadHubShowSuccess andNoteText:@"数据刷新成功!"];
}

// 显示成功-字体模式
- (IBAction)failIconFontBtnAction:(id)sender
{
    RYHeadHub *headHub = [RYHeadHub shareInstance];
    [headHub showHeadHubWithStatus:RYHeadHubShowFail andNoteText:@"数据下载失败!"];
}




@end
