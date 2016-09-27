//
//  MainTableViewCell.m
//  NewTreeTable
//
//  Created by rhcf_wujh on 16/9/27.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *remarkLabel;

@end

static NSString * const  cellID = @"MainTableViewCellID";

@implementation MainTableViewCell

+ (instancetype)mainTableViewCellWithTableView:(UITableView *)tableView{
    MainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setPeople:(PeopleModel *)people{
    _people = people;
    
    self.titleLabel.text = people.titleStr;
    self.remarkLabel.text = people.remarkStr;
    if (people.isOpen) {
//        [UIView animateWithDuration:0.3 animations:^{
            self.iconIV.transform = CGAffineTransformMakeRotation(90 * M_PI/180.0);
//        }];
    }else {
//        [UIView animateWithDuration:0.3 animations:^{
            self.iconIV.transform = CGAffineTransformIdentity;
//    }];
    }
}

/**
 *  重写布局
 */
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
