//
//  UIView+TTPlaceholderView.h
//  UIViewPlaceholderView
//
//  Created by Chouee on 2017/12/15.
//  Copyright © 2017年 Chouee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TTPlaceholderView)

#pragma mark - Public

/**
 显示固定样式视图
 */
- (void)tt_showPlaceholderViewWithImageName:(NSString *)imageName title:(NSString *)title attributes:(NSDictionary *)attributes click:(void(^)(void))click;

/**
 显示自定义样式视图
 */
- (void)tt_showCustomPlaceholderView:(UIView *)customView click:(void(^)(void))click;

/**
 移除占位视图
 */
- (void)tt_removePlaceholderView;


#pragma mark - Convinence Method

/**
 服务端错误
 */
- (void)tt_showServerErrorWithclick:(void(^)(void))click;

/**
 网络错误
 */
- (void)tt_showNetworkErrorWithclick:(void(^)(void))click;

/**
 空白占位图
 */
- (void)tt_showBlankWithclick:(void(^)(void))click;

@end
