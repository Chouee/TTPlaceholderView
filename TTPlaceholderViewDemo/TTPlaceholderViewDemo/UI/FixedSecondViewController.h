//
//  FixedSecondViewController.h
//  TTPlaceholderViewDemo
//
//  Created by Kingdee on 2020/8/28.
//  Copyright © 2020 Chouee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TTPlaceHolderType) {
    /// 无数据
    TTPlaceHolderTypeNoData,
    /// 无网络
    TTPlaceHolderTypeNoNetwork,
    /// 服务端错误
    TTPlaceHolderTypeServerError
};

@interface FixedSecondViewController : UIViewController

@property (nonatomic, assign) TTPlaceHolderType type;

@end

NS_ASSUME_NONNULL_END
