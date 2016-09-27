//
//  SectionModel.m
//  NewTreeTable
//
//  Created by rhcf_wujh on 16/9/27.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import "SectionModel.h"

@implementation SectionModel

- (instancetype)init{
    self = [super init];
    if (self) {
        _onlyID = [NSString stringWithFormat:@"%@",self];
        _bodies = [[NSMutableArray alloc]init];
    }
    return self;
}


+(instancetype)randomModel{
    SectionModel * model = [[SectionModel alloc]init];
    model.titleStr = [NSString randomStr];
    model.remarkStr = [NSString randomStr];
    model.isOpen = NO;
    return model;
}

@end
