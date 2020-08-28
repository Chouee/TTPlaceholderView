//
//  CustomView.m
//  TTPlaceholderViewDemo
//
//  Created by Chouee on 2018/2/26.
//  Copyright © 2018年 Chouee. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

+ (instancetype)customView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

@end
