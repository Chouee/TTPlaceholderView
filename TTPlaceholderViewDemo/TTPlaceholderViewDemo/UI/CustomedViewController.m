//
//  CustomedViewController.m
//  TTPlaceholderViewDemo
//
//  Created by Kingdee on 2020/8/28.
//  Copyright © 2020 Chouee. All rights reserved.
//

#import "CustomedViewController.h"
#import "CustomView.h"
#import "UIView+TTPlaceholderView.h"

@interface CustomedViewController ()

@end

@implementation CustomedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"自定义样式占位图";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupPlaceHolderView];
}

- (void)setupPlaceHolderView {
    CustomView *customView = [CustomView customView];
    customView.frame = [UIScreen mainScreen].bounds;
    
    [self.view tt_showCustomPlaceholderView:customView click:^{
        
    }];
}

@end
