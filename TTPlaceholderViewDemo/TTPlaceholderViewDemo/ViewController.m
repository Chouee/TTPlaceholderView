//
//  ViewController.m
//  TTPlaceholderViewDemo
//
//  Created by Chouee on 2018/2/26.
//  Copyright © 2018年 Chouee. All rights reserved.
//
#import "CustomView.h"
#import "UIView+TTPlaceholderView.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//模拟网络出错
- (IBAction)btnClick:(id)sender {
    NSString *title = @"点我重新加载~";
    NSString *imageName = @"无网络";
    
    //富文本属性
    //    NSDictionary *attributes = @{
    //                                 NSFontAttributeName:[UIFont systemFontOfSize:20.0f],
    //                                 NSForegroundColorAttributeName:[UIColor orangeColor]
    //                                 };
    
    __weak typeof(self) weakSelf = self;
    
    [self.view tt_showPlaceholderViewWithImageName:imageName title:title attributes:nil reloadBlock:^{
        
        [weakSelf.view tt_removePlaceholderView];
        
    }];
}

//自定义占位图
- (IBAction)customClick:(id)sender {
    CustomView *customView = [CustomView customView];
    customView.frame = [UIScreen mainScreen].bounds;
    __weak typeof(self) weakSelf = self;
    [self.view tt_showCustomPlaceholderView:customView reloadBlock:^{
        [weakSelf.view tt_removePlaceholderView];
    }];
}


@end
