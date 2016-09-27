//
//  UIView+Extension.h
//  MJRefreshExample
//
//  Created by nacker on 15-3-9.
//  Copyright © 2016年 帶頭二哥 QQ:648959. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;
@property (assign, nonatomic) CGFloat rhcf_centerX;
@property (assign, nonatomic) CGFloat rhcf_centerY;
@property (readonly, nonatomic) CGFloat maxY;
@property (readonly, nonatomic) CGFloat maxX;
@property (readonly, nonatomic) CGFloat minY;
@property (readonly, nonatomic) CGFloat minX;
@property (readonly, nonatomic) CGFloat midY;
@property (readonly, nonatomic) CGFloat midX;
@end
