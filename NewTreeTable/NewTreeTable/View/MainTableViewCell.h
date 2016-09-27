//
//  MainTableViewCell.h
//  NewTreeTable
//
//  Created by rhcf_wujh on 16/9/27.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PeopleModel.h"

@interface MainTableViewCell : UITableViewCell

@property (nonatomic ,strong) PeopleModel * people;

@property (weak, nonatomic) IBOutlet UIImageView *iconIV;

+ (instancetype)mainTableViewCellWithTableView:(UITableView *)tableView;

@end
