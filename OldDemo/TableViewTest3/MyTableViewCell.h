//
//  MyTableViewCell.h
//  TableViewTest3
//
//  Created by wujh on 15/10/19.
//  Copyright (c) 2015年 南京. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;

@interface MyTableViewCell : UITableViewCell

@property (nonatomic,strong)Model * model;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
