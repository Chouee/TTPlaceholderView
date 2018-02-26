//
//  UIView+TTPlaceholderView.h
//  UIViewPlaceholderView
//
//  Created by Chouee on 2017/12/15.
//  Copyright © 2017年 Chouee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TTPlaceholderView)

@property (nonatomic, strong, readonly) UIView *tt_placeholderView;

/**
 显示固定样式视图
 */
- (void)tt_showPlaceholderViewWithImageName:(NSString *)imageName title:(NSString *)title attributes:(NSDictionary *)attributes reloadBlock:(void(^)(void))reloadBlock;

/**
 显示自定义样式视图
 */
- (void)tt_showCustomPlaceholderView:(UIView *)customView reloadBlock:(void(^)(void))reloadBlock;

/**
 移除占位视图
 */
- (void)tt_removePlaceholderView;

@end
