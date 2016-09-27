//
//  HeaderView.m
//  NewTreeTable
//
//  Created by rhcf_wujh on 16/9/27.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView ()

@property (weak, nonatomic) IBOutlet UIButton *headerBtn;
@property (weak, nonatomic) IBOutlet UILabel *titileLabel;
@property (weak, nonatomic) IBOutlet UILabel *remarkLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;

@end

static NSString * const headerViewID = @"HeaderViewID";

@implementation HeaderView

+ (instancetype)headerView:(UITableView *)tableView{
    HeaderView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewID];
    if (!view) {
        view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
        view.width = SCREEN.width;
        
        UIView * bv = [[UIView alloc]init];
        bv.backgroundColor = [UIColor colorWithRed:255/255.0 green:222/255.0 blue:173/255.0 alpha:1.0];
        view.backgroundView = bv;
    }
    return view;
}

- (void)awakeFromNib{
    [self.headerBtn addTarget:self action:@selector(HeaderViewClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)HeaderViewClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    
    if (btn.selected) {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconIV.transform = CGAffineTransformMakeRotation(90 * M_PI/180.0);
        }];
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            self.iconIV.transform = CGAffineTransformIdentity;
        }];
    }
    
    if (self.headerViewClickBlock) {
        self.headerViewClickBlock();
    }
    
}

- (void)setModel:(SectionModel *)model{
    _model = model;
    if (model) {
        self.titileLabel.text = model.titleStr;
        self.remarkLabel.text = model.remarkStr;
    }
}

@end
