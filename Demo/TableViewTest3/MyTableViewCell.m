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
#import <Masonry.h>

@interface MyTableViewCell()

@property(nonatomic, strong) UILabel *label;
@property(nonatomic, strong) UIImageView *backIV;
@property(nonatomic, strong) UIImageView *imageViewArrow;
@property(nonatomic, strong) UIButton *editBtn;

@end


@implementation MyTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"status";

    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
         cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    _label = [[UILabel alloc]init];//WithFrame:CGRectMake(30, 0, SCREEN.width - 40, 40)];
    _label.backgroundColor = [UIColor colorWithRed:204.0/255 green:238.0/255 blue:208.0/255 alpha:0.0];
    _backIV = [[UIImageView alloc]init];
    _imageViewArrow = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 15, 15)];
    [_imageViewArrow setImage:[UIImage imageNamed:@"arrow_right1.png"]];
    [_backIV addSubview:_imageViewArrow];
    [_backIV addSubview:_label];
    [_backIV addSubview:self.editBtn];
    [self addSubview:_backIV];
    _backIV.userInteractionEnabled = YES;
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0).offset(30);
        make.right.equalTo(@0);
        make.top.equalTo(@0);
        make.height.mas_equalTo(40);
    }];
    
    [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0).offset(-40);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(@0);
    }];
}

- (void)setModel:(Model *)model{
    _model = model;
    if (model.isOpen == YES) {
        [_imageViewArrow setImage:[UIImage imageNamed:@"arrow_bottom1.png"]];
    }
    else if (model.isOpen == NO) {
        [_imageViewArrow setImage:[UIImage imageNamed:@"arrow_right1.png"]];
    }
    
    self.editBtn.hidden = YES;
    
    if (model.level == 1) {
        _label.backgroundColor = [UIColor colorWithRed:204.0/255 green:238.0/255 blue:208.0/255 alpha:0.333];//修改一级颜色alpha
        _backIV.frame = CGRectMake(10, 0, SCREEN.width-10, 40);
        _label.text = _model.name;
    }
    else if (model.level == 2) {
        _label.backgroundColor = [UIColor colorWithRed:204.0/255 green:238.0/255 blue:208.0/255 alpha:0.666];//修改二级颜色alpha
        _backIV.frame = CGRectMake(10 + 20, 0, SCREEN.width-10-20, 40);
        _label.text = _model.name;
    }
    else if (model.level == 3 ) {
        _label.backgroundColor = [UIColor colorWithRed:204.0/255 green:238.0/255 blue:208.0/255 alpha:1.0];//修改三级颜色alpha
        _backIV.frame = CGRectMake(10 + 20*2, 0,  SCREEN.width-10-20*2, 40);
        _label.text = _model.name;
    }
    else if (model.level == 4) {
        _label.backgroundColor = [UIColor redColor];
        _backIV.frame = CGRectMake(10 + 20*3, 0,  SCREEN.width-10-20*3, 40);
        _label.text = _model.name;
        // 只有第四级才可能被点击
        self.editBtn.hidden = !model.isEditing;
        self.editBtn.selected = model.isSelected;
    } else {
        _label.backgroundColor = [UIColor blueColor];
        _backIV.frame = CGRectMake(10, 0,  SCREEN.width-10, 40);
        _label.text = _model.name;
    }
}

- (void)modelSelected:(UIButton *)btn {
    _model.isSelected = !_model.isSelected;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedClicked:)] && self.index) {
        [self.delegate selectedClicked:self.index];
    }
}

- (UIButton *)editBtn {
    if (!_editBtn) {
        _editBtn = [[UIButton alloc]init];
        [_editBtn addTarget:self action:@selector(modelSelected:) forControlEvents:UIControlEventTouchUpInside];
        _editBtn.backgroundColor = [UIColor yellowColor];
//        _editBtn.hidden = YES;
        [_editBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_editBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
        [_editBtn setTitle:@"未选中" forState:UIControlStateNormal];
        [_editBtn setTitle:@"选中" forState:UIControlStateSelected];
    }
    return _editBtn;
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
