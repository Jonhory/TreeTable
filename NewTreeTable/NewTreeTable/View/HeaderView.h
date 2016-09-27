//
//  HeaderView.h
//  NewTreeTable
//
//  Created by rhcf_wujh on 16/9/27.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SectionModel.h"

@interface HeaderView : UITableViewHeaderFooterView

+ (instancetype)headerView:(UITableView *)tableView;

@property (nonatomic ,strong)SectionModel * model;

@property (copy, nonatomic) void(^headerViewClickBlock)();

@end
