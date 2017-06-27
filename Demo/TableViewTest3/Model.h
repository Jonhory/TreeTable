//
//  Model.h
//  TableViewTest3
//
//  Created by wujh on 15/10/19.
//  Copyright (c) 2015年 南京. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@interface Model : NSObject

@property (nonatomic,strong) NSString * name;
@property(nonatomic, assign) int id;
@property (nonatomic,assign) int level;
@property(nonatomic, strong) NSString *fatherID;
@property (nonatomic, strong) NSMutableArray <Model*>*sons;

@property (nonatomic,assign) BOOL isOpen;
@property(nonatomic, assign) BOOL isSelected;
@property(nonatomic, assign) BOOL isEditing;
@property (nonatomic, strong) Model * parentModel;

+ (instancetype)initWithName:(NSString*)name withLevel:(int)level withParentModel:(Model*)parentModel;

@end


@interface Resp : NSObject

@property(nonatomic, strong) NSMutableArray <Model*>*data;
@property(nonatomic, strong) NSString *code;

@end
