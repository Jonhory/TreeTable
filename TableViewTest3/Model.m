//
//  Model.m
//  TableViewTest3
//
//  Created by wujh on 15/10/19.
//  Copyright (c) 2015年 南京. All rights reserved.
//

#import "Model.h"

@implementation Model

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (void)setName:(NSString *)name{
    _name = name;
}
- (void)setValue:(id)value forKey:(NSString *)key{
    
}
-(void)setLevel:(int)level{
    _level = level;
}
- (void)setParentModel:(Model *)parentModel{
    _parentModel = parentModel;
}
+ (instancetype)initWithName:(NSString*)name withLevel:(int)level withParentModel:(Model*)parentModel{
    Model * model = [[Model alloc]init];
    model.name = name;
    model.level = level;
    model.parentModel = parentModel;
    return model;
}
@end
