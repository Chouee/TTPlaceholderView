//
//  ViewController.m
//  TTPlaceholderViewDemo
//
//  Created by Chouee on 2018/2/26.
//  Copyright © 2018年 Chouee. All rights reserved.
//

#import "ViewController.h"
#import "FixedFirstViewController.h"
#import "CustomedViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//模拟网络出错
- (IBAction)btnClick:(id)sender {
    
    FixedFirstViewController *vc = [[FixedFirstViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

//自定义占位图
- (IBAction)customClick:(id)sender {
    CustomedViewController *vc = [[CustomedViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
