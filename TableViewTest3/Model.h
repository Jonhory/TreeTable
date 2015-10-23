//
//  Model.h
//  TableViewTest3
//
//  Created by wujh on 15/10/19.
//  Copyright (c) 2015年 南京. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic,strong)NSString * name;

@property (nonatomic,assign)int level;

//@property (nonatomic,assign)int parentLevel;

//@property (nonatomic ,strong)NSString * parentText;

@property (nonatomic,strong)Model * parentModel;

+ (instancetype)initWithName:(NSString*)name withLevel:(int)level withParentModel:(Model*)parentModel;

@end
