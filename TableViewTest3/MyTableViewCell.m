//
//  MyTableViewCell.m
//  TableViewTest3
//
//  Created by wujh on 15/10/19.
//  Copyright (c) 2015年 南京. All rights reserved.
//
#define SCREEN [UIScreen mainScreen].bounds.size

#import "MyTableViewCell.h"
#import "Model.h"

@interface MyTableViewCell(){
    UILabel * _label ;
}

@end


@implementation MyTableViewCell




+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"status";

    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
         cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
     }
     return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}
- (void)initView{
    UILabel * label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor lightGrayColor];
    
//    label.text = _model.name;
    [self addSubview:label];
    _label = label;
}

- (void)setModel:(Model *)model{
    _model = model;
    
    if (model.level == 1) {
        
        _label.frame = CGRectMake(10, 0, SCREEN.width-10, 40);
        _label.text = _model.name;
    }
    
    if (model.level == 2) {
        _label.frame = CGRectMake(10 + 20, 0, SCREEN.width-10-20, 40);
        _label.text = _model.name;
    }
    
    if (model.level == 3 ) {
        _label.frame = CGRectMake(10 + 20*2, 0,  SCREEN.width-10-20*2, 40);
        _label.text = _model.name;
    }
    
    if (model.level == 4 ) {
        _label.frame = CGRectMake(10 + 20*3, 0,  SCREEN.width-10-20*3, 40);
        _label.text = _model.name;
    }
    if (model.level == 5 ) {
        _label.frame = CGRectMake(10 + 20*4, 0,  SCREEN.width-10-20*4, 40);
        _label.text = _model.name;
    }
    if (model.level == 6 ) {
        _label.frame = CGRectMake(10 + 20*5, 0,  SCREEN.width-10-20*5, 40);
        _label.text = _model.name;
    }
    
    
    
}
//- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath{
////    MyTableViewCell * cell = [UITableViewCel
//}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
//    NSLog(@"选中 %d",selected);
    // Configure the view for the selected state
}

@end
