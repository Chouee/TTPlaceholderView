//
//  FixedSecondViewController.m
//  TTPlaceholderViewDemo
//
//  Created by Kingdee on 2020/8/28.
//  Copyright © 2020 Chouee. All rights reserved.
//

#import "FixedSecondViewController.h"
#import "UIView+TTPlaceholderView.h"

@interface FixedSecondViewController ()

@end

@implementation FixedSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"固定样式占位图";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupPlaceHolderView];
}

- (void)setupPlaceHolderView {
    switch (_type) {
        case TTPlaceHolderTypeNoData: {
            [self.view tt_showBlankWithclick:^{
                
            }];
            break;
        }
        case TTPlaceHolderTypeNoNetwork: {
            [self.view tt_showNetworkErrorWithclick:^{
                
            }];
            break;
        }
        case TTPlaceHolderTypeServerError: {
            [self.view tt_showServerErrorWithclick:^{
                
            }];
            break;
        }
        default:
            break;
    }
}
@end
