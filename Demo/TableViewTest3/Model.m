//
//  Model.m
//  TableViewTest3
//
//  Created by wujh on 15/10/19.
//  Copyright (c) 2015年 南京. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (instancetype)initWithName:(NSString*)name withLevel:(int)level withParentModel:(Model*)parentModel{
    Model * model = [[Model alloc]init];
    model.name = name;
    model.level = level;
    model.parentModel = parentModel;
    return model;
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"sons":@"Model"
             };
}

@end


@implementation Resp

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"data":@"Model"
             };
}

@end
