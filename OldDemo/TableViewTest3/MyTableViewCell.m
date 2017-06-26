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
    UILabel * _label;
    UIImageView * _imageView;
    UIImageView * _imageViewArrow;
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
    _label = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, SCREEN.width - 40, 40)];
    _label.backgroundColor = [UIColor colorWithRed:204.0/255 green:238.0/255 blue:208.0/255 alpha:0.0];
    _imageView = [[UIImageView alloc]init];
    _imageViewArrow = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 15, 15)];
    [_imageViewArrow setImage:[UIImage imageNamed:@"arrow_right1.png"]];
    [_imageView addSubview:_imageViewArrow];
    [_imageView addSubview:_label];
    [self addSubview:_imageView];
}
- (void)setModel:(Model *)model{
    _model = model;
    if (model.isOpen == YES) {
        [_imageViewArrow setImage:[UIImage imageNamed:@"arrow_bottom1.png"]];
    }
    else if (model.isOpen == NO) {
        [_imageViewArrow setImage:[UIImage imageNamed:@"arrow_right1.png"]];
    }
    
    if (model.level == 1) {
        _label.backgroundColor = [UIColor colorWithRed:204.0/255 green:238.0/255 blue:208.0/255 alpha:0.333];//修改一级颜色alpha
        _imageView.frame = CGRectMake(10, 0, SCREEN.width-10, 40);
        _label.text = _model.name;
    }
    else if (model.level == 2) {
        _label.backgroundColor = [UIColor colorWithRed:204.0/255 green:238.0/255 blue:208.0/255 alpha:0.666];//修改二级颜色alpha
        _imageView.frame = CGRectMake(10 + 20, 0, SCREEN.width-10-20, 40);
        _label.text = _model.name;
    }
    else if (model.level == 3 ) {
        _label.backgroundColor = [UIColor colorWithRed:204.0/255 green:238.0/255 blue:208.0/255 alpha:1.0];//修改三级颜色alpha
        _imageView.frame = CGRectMake(10 + 20*2, 0,  SCREEN.width-10-20*2, 40);
        _label.text = _model.name;
    }
    else if (model.level == 4) {
        _label.backgroundColor = [UIColor redColor];
        _imageView.frame = CGRectMake(10 + 20*3, 0,  SCREEN.width-10-20*3, 40);
        _label.text = _model.name;
    } else {
        _label.backgroundColor = [UIColor blueColor];
        _imageView.frame = CGRectMake(10, 0,  SCREEN.width-10, 40);
        _label.text = _model.name;
    }
}


- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
//    NSLog(@"选中 %d",selected);
    // Configure the view for the selected state
}

@end
