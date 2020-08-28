//
//  FixedFirstViewController.m
//  TTPlaceholderViewDemo
//
//  Created by Kingdee on 2020/8/28.
//  Copyright © 2020 Chouee. All rights reserved.
//

#import "FixedFirstViewController.h"
#import "FixedSecondViewController.h"

@interface FixedFirstViewController ()

@end

@implementation FixedFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"固定样式占位图";
    
}

- (IBAction)clickFirstBtn:(id)sender {
    [self toSecondVC:TTPlaceHolderTypeNoData];
}

- (IBAction)clickSecondBtn:(id)sender {
    [self toSecondVC:TTPlaceHolderTypeNoNetwork];
}

- (IBAction)clickThirdBtn:(id)sender {
    [self toSecondVC:TTPlaceHolderTypeServerError];
}

- (void)toSecondVC:(TTPlaceHolderType)type {
    FixedSecondViewController *secondVC = [[FixedSecondViewController alloc] init];
    secondVC.type = type;
    secondVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
