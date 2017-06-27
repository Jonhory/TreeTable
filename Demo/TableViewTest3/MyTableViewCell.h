//
//  MyTableViewCell.h
//  TableViewTest3
//
//  Created by wujh on 15/10/19.
//  Copyright (c) 2015年 南京. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;
@class MyTableViewCell;

@protocol MyTableViewCellDelegate <NSObject>

- (void)selectedClicked:(NSIndexPath *)index;

@end

@interface MyTableViewCell : UITableViewCell

@property(nonatomic, weak) id<MyTableViewCellDelegate> delegate;

@property (nonatomic,strong)Model * model;
@property(nonatomic, strong) NSIndexPath *index;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
