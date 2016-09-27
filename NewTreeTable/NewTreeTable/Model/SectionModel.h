//
//  SectionModel.h
//  NewTreeTable
//
//  Created by rhcf_wujh on 16/9/27.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject

@property (nonatomic ,copy) NSString * iconName;

@property (nonatomic ,copy) NSString * titleStr;

@property (nonatomic ,copy) NSString * remarkStr;

@property (nonatomic ,copy) NSString * onlyID;

@property (nonatomic ,strong) NSMutableArray * bodies;//peopleModel

+ (instancetype)randomModel;

@end
