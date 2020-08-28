//
//  UIView+TTPlaceholderView.m
//  UIViewPlaceholderView
//
//  Created by Chouee on 2017/12/15.
//  Copyright © 2017年 Chouee. All rights reserved.
//


#import <objc/runtime.h>
#import "UIView+TTPlaceholderView.h"

@interface UIView()

@property (nonatomic, strong, readonly) UIView *tt_placeholderView;
/// 记录当前视图是否可滚动
@property (nonatomic, assign) BOOL tt_oriScrollEnable;
/// 缓存点击操作
@property (nonatomic, copy) void (^tt_click)(void);

@end

@implementation UIView (TTPlaceholderView)


static void *placeholderViewKey = &placeholderViewKey;
static void *originalScrollEnabledKey = &originalScrollEnabledKey;
static void *clickKey = &clickKey;

#pragma mark - Public

/**
 显示固定样式视图
 */
- (void)tt_showPlaceholderViewWithImageName:(NSString *)imageName title:(NSString *)title attributes:(NSDictionary *)attributes click:(void(^)(void))click
{
    self.tt_click = click;
    
    if (attributes == nil) {
        attributes = @{
            NSFontAttributeName:[UIFont systemFontOfSize:15.0f],
            NSForegroundColorAttributeName:[UIColor lightGrayColor]
        };
    }
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        self.tt_oriScrollEnable = scrollView.scrollEnabled;
        scrollView.scrollEnabled = NO;
    }
    
    if (self.tt_placeholderView) {
        [self.tt_placeholderView removeFromSuperview];
        self.tt_placeholderView = nil;
    }
    
    //背景
    self.tt_placeholderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.tt_placeholderView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.tt_placeholderView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.tt_placeholderView addGestureRecognizer:tap];
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:imageName];
    [imageView sizeToFit];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor lightTextColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    [label sizeToFit];
    
    //容器
    UIView *containView = [[UIView alloc] init];
    CGFloat containH = imageView.bounds.size.height + 20 + label.bounds.size.height;
    CGFloat containW = self.tt_placeholderView.bounds.size.width;
    CGFloat containY = (self.tt_placeholderView.bounds.size.height - containH) * 0.5;
    CGFloat containX = (self.tt_placeholderView.bounds.size.width - containW) * 0.5;
    containView.frame = CGRectMake(containX, containY, containW, containH);
    [self.tt_placeholderView addSubview:containView];
    
    [containView addSubview:imageView];
    [containView addSubview:label];
    
    CGFloat imageViewW = imageView.bounds.size.width;
    CGFloat imageViewH = imageView.bounds.size.height;
    CGFloat imageViewX = (containView.bounds.size.width - imageViewW) * 0.5;
    CGFloat imageViewY = 0;
    imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    
    CGFloat labelW = containView.bounds.size.width;
    CGFloat labelH = label.bounds.size.height;
    CGFloat labelX = (containView.bounds.size.width - labelW) * 0.5;
    CGFloat labelY = CGRectGetMaxY(imageView.frame) + 20;
    label.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = NSMakeRange(0, title.length);
    if (range.location != NSNotFound) {
        [attrStr addAttributes:attributes range:range];
        label.attributedText = attrStr;
    }
    
    
    
    
}

/**
 显示自定义样式视图
 */
- (void)tt_showCustomPlaceholderView:(UIView *)customView click:(void(^)(void))click
{
    self.tt_click = click;
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        self.tt_oriScrollEnable = scrollView.scrollEnabled;
        scrollView.scrollEnabled = NO;
    }
    
    if (self.tt_placeholderView) {
        [self.tt_placeholderView removeFromSuperview];
        self.tt_placeholderView = nil;
    }
    self.tt_placeholderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.tt_placeholderView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.tt_placeholderView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.tt_placeholderView addGestureRecognizer:tap];
    
    UIView *containView = [[UIView alloc] init];
    CGFloat containH = self.tt_placeholderView.bounds.size.width;
    CGFloat containW = self.tt_placeholderView.bounds.size.width;
    CGFloat containY = (self.tt_placeholderView.bounds.size.height - containH) * 0.5;
    CGFloat containX = (self.tt_placeholderView.bounds.size.width - containW) * 0.5;
    containView.frame = CGRectMake(containX, containY, containW, containH);
    [self.tt_placeholderView addSubview:containView];
    
    CGFloat customW = CGRectGetWidth(customView.frame);
    CGFloat customH = CGRectGetHeight(customView.frame);
    CGFloat customX = (containW - customW) * 0.5;
    CGFloat customY = (containH - customH) * 0.5;
    customView.frame = CGRectMake(customX, customY, customW, customH);
    [containView addSubview:customView];
    
}

/**
 * 移除占位视图
 * 添加新占位视图时，会自动移除上一个占位视图，不需要手动调用该方法。
 */
- (void)tt_removePlaceholderView {
    if (self.tt_placeholderView) {
        [self.tt_placeholderView removeFromSuperview];
        self.tt_placeholderView = nil;
    }
    // 复原UIScrollView的scrollEnabled
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        scrollView.scrollEnabled = self.tt_oriScrollEnable;
    }
}

#pragma mark - Convinence Method

/**
 服务端错误
 */
- (void)tt_showServerErrorWithclick:(void(^)(void))click {
    //富文本属性
    //    NSDictionary *attributes = @{
    //                                 NSFontAttributeName:[UIFont systemFontOfSize:20.0f],
    //                                 NSForegroundColorAttributeName:[UIColor orangeColor]
    //                                 };
    [self tt_showPlaceholderViewWithImageName:@"bg-server-error" title:@"服务器错误" attributes:nil click:click];
}

/**
 网络错误
 */
- (void)tt_showNetworkErrorWithclick:(void(^)(void))click {
    [self tt_showPlaceholderViewWithImageName:@"bg-no-network" title:@"无法连接网络，请检查您的网络设置" attributes:nil click:click];
}

/**
 空白占位图
 */
- (void)tt_showBlankWithclick:(void(^)(void))click {
    [self tt_showPlaceholderViewWithImageName:@"bg-no-data" title:@"这里空空如也" attributes:nil click:click];
}

#pragma mark - Private


/// associate
- (UIView *)tt_placeholderView
{
    return objc_getAssociatedObject(self, &placeholderViewKey);
}

- (void)setTt_placeholderView:(UIView *)tt_placeholderView
{
    objc_setAssociatedObject(self, &placeholderViewKey, tt_placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)tt_oriScrollEnable
{
    return [objc_getAssociatedObject(self, &originalScrollEnabledKey) boolValue];
}

- (void)setTt_oriScrollEnable:(BOOL)tt_oriScrollEnable
{
    objc_setAssociatedObject(self, &originalScrollEnabledKey, @(tt_oriScrollEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(void))tt_click
{
    return objc_getAssociatedObject(self, &clickKey);
}

- (void)setTt_click:(void (^)(void))tt_click
{
    objc_setAssociatedObject(self, &clickKey, tt_click, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


/**
 点击事件
 */
- (void)tap {
    [self tt_removePlaceholderView];
    
    if (self.tt_click) {
        self.tt_click();
    }
}


@end
