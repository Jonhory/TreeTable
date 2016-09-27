//
//  PeopleModel.m
//  NewTreeTable
//
//  Created by rhcf_wujh on 16/9/27.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import "PeopleModel.h"

@implementation PeopleModel

+(instancetype)random{
    PeopleModel * model = [[PeopleModel alloc]init];
    model.titleStr = [NSString randomStr];
    model.remarkStr = [NSString randomStr];
    model.onlyID = [NSString stringWithFormat:@"%@",model];
    return model;
}

@end


