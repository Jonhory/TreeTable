//
//  ViewController.m
//  TableViewTest3
//
//  Created by wujh on 15/10/19.
//  Copyright (c) 2015年 南京. All rights reserved.
//

#define SCREEN [UIScreen mainScreen].bounds.size
#define CellH 40 //每行cell高度
#define NAV_HEIGHT  44

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "Model.h"
#import <MJExtension.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate, MyTableViewCellDelegate>
{
    BOOL _firstEnter;//第一次进入的时候tableview高度
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *editBtn;// 编辑按钮

@property(nonatomic, strong) Resp *resp;// 数据源
@property (nonatomic, strong) NSMutableArray <Model *>*dataArr;// 用于显示的数据源
@property (nonatomic, strong) NSMutableDictionary *dicOpen;// 用于判断是否已展开，key：(Model *) value: model

@property(nonatomic, strong) NSMutableArray <Model*>*fourthArr;// 第四级数据 用于处理编辑状态的显示

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _dataArr = [NSMutableArray array];
    _dicOpen = [NSMutableDictionary dictionary];
    _firstEnter = YES;

    [self testData];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAV_HEIGHT, SCREEN.width, SCREEN.height - NAV_HEIGHT)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UIView * viewZero = [[UIView alloc]initWithFrame:CGRectZero];
    [_tableView setTableFooterView:viewZero];
    [self.view addSubview:_tableView];
    
    [self.view addSubview:self.editBtn];

}

- (int)random{
    int random = arc4random()%10+1;
    return random;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CellH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell * cell = [MyTableViewCell cellWithTableView:tableView];
    cell.model = _dataArr[indexPath.row];
    cell.index = indexPath;
    cell.delegate = self;
    if (_firstEnter) {
        [self tableViewFrameAndScroll];
    }
    return cell;
}

#pragma mark 重新判断tableview的范围及是否可以滑动
- (void)tableViewFrameAndScroll{
    CGFloat listHeight = SCREEN.height - NAV_HEIGHT;
    CGFloat listH = CellH * _dataArr.count;
    CGFloat listHHH = listH > listHeight ? listHeight : listH;
    BOOL isScroll = listH > listHeight ? YES : NO;
    _tableView.bounces = isScroll;
    _tableView.frame = CGRectMake(0,  NAV_HEIGHT, SCREEN.width,listHHH);
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyTableViewCell * cell = (MyTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    Model * model = cell.model;
    // 如果点击处于编辑状态中的cell
    if (model.isEditing) {
        return;
    }
    if ([_dicOpen objectForKey:[NSString stringWithFormat:@"%@",cell.model]] == model) {
        model.isOpen = NO;
        
        NSLog(@"第二次点击该cell  cell Name :%@",model);
        [_dicOpen setValue:nil forKey:[NSString stringWithFormat:@"%@",cell.model]];
        
        NSMutableIndexSet * indexSets = [[NSMutableIndexSet alloc]init];//
        
        Model * modelLevel2 = [[Model alloc]init];//二级的模型 是三级的parentModel
        NSMutableArray * arr2 = [NSMutableArray array];//二级的数组 存二级的模型
        
        Model * modelLevel3 = [[Model alloc]init];//三级的模型 是四级的parentModel
        NSMutableArray * arr3 = [NSMutableArray array];//三级的数组 存三级的模型
        
        Model * modelLevel4 = [[Model alloc]init];
        NSMutableArray * arr4 = [NSMutableArray array];
        
        __block Model * modelLe2 = modelLevel2;
        __block Model * modelLe3 = modelLevel3;
        __block Model * modelLe4 = modelLevel4;
        
        if (model.level ==1 ) {//点击一级分组删除
            [_dataArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                Model * modelX = [_dataArr objectAtIndex:idx];
                
                if (modelX.level == 2 && modelX.parentModel == model  ) {
                    modelX.isOpen = NO;
                    [_dicOpen setValue:nil forKey:[NSString stringWithFormat:@"%@",modelX]];
                    [indexSets addIndex:idx];
                    
                    modelLe2 = [_dataArr objectAtIndex:idx];
                    [arr2 addObject:modelLe2];
                }
                
                if (modelX.level == 3 ) {
                    for (int i = 0 ; i < arr2.count; i++) {
                        if (modelX.parentModel == arr2[i]) {
                            modelX.isOpen = NO;
                            [_dicOpen setValue:nil forKey:[NSString stringWithFormat:@"%@",modelX]];
                            [indexSets addIndex:idx];
                            
                            modelLe3 = [_dataArr objectAtIndex:idx];
                            [arr3 addObject:modelLe3];
                        }
                    }
                }
                
                if (modelX.level == 4) {
                    for (int i = 0; i < arr3.count; i++) {
                        if (modelX.parentModel == arr3[i]) {
                            modelX.isOpen = NO;
                            [_dicOpen setValue:nil forKey:[NSString stringWithFormat:@"%@",modelX]];
                            [indexSets addIndex:idx];
                            
                            modelLe4 = [_dataArr objectAtIndex:idx];
                            [arr4 addObject:modelLe4];
                        }
                    }
                }
            }];
        }
        else if (model.level == 2) {//点击二级分组删除
            [_dataArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                Model * modelY = [_dataArr objectAtIndex:idx];
                
                if (modelY.level == 3 && modelY.parentModel == model ) {
                    modelY.isOpen = NO;
                    [_dicOpen setValue:nil forKey:[NSString stringWithFormat:@"%@",modelY]];
                    [indexSets addIndex:idx];
                    
                    modelLe3 = [_dataArr objectAtIndex:idx];
                    [arr3 addObject:modelLe3];
                }
                
                if (modelY.level == 4) {
                    for (int i = 0; i < arr3.count; i++) {
                        modelY.isOpen = NO;
                        [_dicOpen setValue:nil forKey:[NSString stringWithFormat:@"%@",modelY]];
                        if (modelY.parentModel == arr3[i]) {
                            [indexSets addIndex:idx];
                            
                            modelLe4 = [_dataArr objectAtIndex:idx];
                            [arr4 addObject:modelLe4];
                        }
                    }
                }
            }];
        }
        else if (model.level == 3) {//点击三级分组删除
            [_dataArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                Model * modelZ = [_dataArr objectAtIndex:idx];
                
                if (modelZ.level == 4 && modelZ.parentModel == model ) {
                    modelZ.isOpen = NO;
                    [_dicOpen setValue:nil forKey:[NSString stringWithFormat:@"%@",modelZ]];
                    [indexSets addIndex:idx];
                    
                    modelLe4 = [_dataArr objectAtIndex:idx];
                    [arr4 addObject:modelLe4];
                }
            }];
        }
        else if (model.level == 4) {// 点击四级
            
        }
        
        [_dataArr removeObjectsAtIndexes:indexSets];
    }
    else if ([_dicOpen objectForKey:[NSString stringWithFormat:@"%@",cell.model]] == nil) {
        model.isOpen = YES;
        NSLog(@"第一次点击该cell  :%@  level:%d",model.name, model.level);
        [_dicOpen setValue:model forKey:[NSString stringWithFormat:@"%@",cell.model]];
        NSLog(@"%@",_dicOpen);
        if (model.level == 1) {//点击一级
            for (int i = 0; i < model.sons.count; i++) {
                Model * m = model.sons[i];
                m.parentModel = model;
                [_dataArr insertObject:m atIndex:indexPath.row + 1 + i];
            }
        }
        else if (model.level == 2) {//点击二级
            for (int i = 0; i < model.sons.count; i++) {
                Model * m = model.sons[i];
                m.parentModel = model;
                [_dataArr insertObject:m atIndex:indexPath.row + 1 + i];
            }
        }
        else if (model.level == 3) {//点击三级
            for (int i = 0; i < model.sons.count; i++) {
                Model * m = model.sons[i];
                m.parentModel = model;
                [_dataArr insertObject:m atIndex:indexPath.row + 1 + i];
            }
        }
        else if (model.level == 4) {// 点击四级
            model.isOpen = NO;// 箭头不向下
        }
    }
    [_tableView reloadData];
}

// 点击cell选择按钮
- (void)selectedClicked:(NSIndexPath *)index {
    [_tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)goEdit:(UIButton *)btn {
    btn.selected = !btn.selected;
    NSLog(@" dd=++>>> %d",btn.selected);
    
    for (Model * m in self.fourthArr) {
        m.isEditing = btn.selected;
    }
    
    [self.tableView reloadData];
    
    if (btn.selected == NO) {
        for (Model * m in self.fourthArr) {
            if (m.isSelected) {
                // 重置选中状态
                m.isSelected = NO;
                NSLog(@"选中了%@",m.name);
            }
        }
    }
}

- (UIButton *)editBtn {
    if (!_editBtn) {
        _editBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN.width - 100, 20, 100, NAV_HEIGHT-20)];
        [_editBtn addTarget:self action:@selector(goEdit:) forControlEvents:UIControlEventTouchUpInside];
        _editBtn.backgroundColor = [UIColor purpleColor];
        [_editBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_editBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_editBtn setTitle:@"完成" forState:UIControlStateSelected];
    }
    return _editBtn;
}

- (void)testData {
    NSString * jsonStr = @"{\"data\":[{\"name\":\"No.11\",\"id\":\"11\",\"fatherID\":\"\",\"level\":1,\"sons\":[{\"name\":\"No.21\",\"id\":\"21\",\"level\":2,\"fatherID\":\"11\",\"sons\":[{\"name\":\"No.31\",\"id\":\"31\",\"level\":3,\"fatherID\":\"21\",\"sons\":[{\"name\":\"No.41\",\"id\":\"41\",\"level\":4,\"fatherID\":\"31\",\"sons\":[]},{\"name\":\"No.42\",\"id\":\"42\",\"level\":4,\"fatherID\":\"31\",\"sons\":[]},{\"name\":\"No.42\",\"id\":\"42\",\"level\":4,\"fatherID\":\"31\",\"sons\":[]},{\"name\":\"No.43\",\"id\":\"43\",\"level\":4,\"fatherID\":\"31\",\"sons\":[]}]},{\"name\":\"No.32\",\"id\":\"32\",\"level\":3,\"fatherID\":\"21\",\"sons\":[]},{\"name\":\"No.33\",\"id\":\"33\",\"level\":3,\"fatherID\":\"21\",\"sons\":[{\"name\":\"No.44\",\"id\":\"44\",\"level\":4,\"fatherID\":\"33\",\"sons\":[]},{\"name\":\"No.45\",\"id\":\"45\",\"level\":4,\"fatherID\":\"33\",\"sons\":[]},{\"name\":\"No.46\",\"id\":\"46\",\"level\":4,\"fatherID\":\"33\",\"sons\":[]},{\"name\":\"No.47\",\"id\":\"47\",\"level\":4,\"fatherID\":\"33\",\"sons\":[]}]}]},{\"name\":\"No.22\",\"id\":\"22\",\"level\":2,\"fatherID\":\"11\",\"sons\":[]},{\"name\":\"No.23\",\"id\":\"23\",\"level\":2,\"fatherID\":\"11\",\"sons\":[]}]},{\"name\":\"No.12\",\"id\":\"12\",\"level\":1,\"fatherID\":\"\",\"sons\":[{\"name\":\"No.24\",\"id\":\"24\",\"fatherID\":\"12\",\"level\":2,\"sons\":[]},{\"name\":\"No.25\",\"id\":\"25\",\"level\":2,\"fatherID\":\"12\",\"sons\":[]},{\"name\":\"No.26\",\"id\":\"26\",\"level\":2,\"fatherID\":\"12\",\"sons\":[{\"name\":\"No.34\",\"id\":\"34\",\"level\":3,\"fatherID\":\"26\",\"sons\":[{\"name\":\"No.48\",\"id\":\"48\",\"level\":4,\"fatherID\":\"34\",\"sons\":[]},{\"name\":\"No.49\",\"id\":\"49\",\"level\":4,\"fatherID\":\"34\",\"sons\":[]},{\"name\":\"No.50\",\"id\":\"50\",\"level\":4,\"fatherID\":\"34\",\"sons\":[]},{\"name\":\"No.51\",\"id\":\"50\",\"level\":4,\"fatherID\":\"34\",\"sons\":[]}]},{\"name\":\"No.35\",\"id\":\"35\",\"level\":3,\"fatherID\":\"26\",\"sons\":[]},{\"name\":\"No.36\",\"id\":\"36\",\"level\":3,\"fatherID\":\"26\",\"sons\":[{\"name\":\"No.52\",\"id\":\"52\",\"level\":4,\"fatherID\":\"36\",\"sons\":[]},{\"name\":\"No.53\",\"id\":\"53\",\"level\":4,\"fatherID\":\"36\",\"sons\":[]},{\"name\":\"No.54\",\"id\":\"54\",\"level\":4,\"fatherID\":\"36\",\"sons\":[]},{\"name\":\"No.55\",\"id\":\"55\",\"level\":4,\"fatherID\":\"36\",\"sons\":[]}]}]}]}],\"code\":\"success\"}";
    NSDictionary * json = [jsonStr mj_JSONObject];
    NSLog(@"%@",json);
    
    self.resp = [Resp mj_objectWithKeyValues:json];
    for (Model * model1 in self.resp.data) {
        [_dataArr addObject:model1];
        
        for (Model * model2 in model1.sons) {
            for (Model * model3 in model2.sons) {
                for (Model * model4 in model3.sons) {
                    [self.fourthArr addObject:model4];
                }
            }
        }
        
    }
}

- (NSMutableArray<Model *> *)fourthArr {
    if (!_fourthArr) {
        _fourthArr = [[NSMutableArray alloc]init];
    }
    return _fourthArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
