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

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL _firstEnter;//第一次进入的时候tableview高度
}

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong )NSMutableArray *dataArr;
@property (nonatomic, strong)NSMutableDictionary *dicOpen;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _dataArr = [NSMutableArray array];
    _dicOpen = [NSMutableDictionary dictionary];
    _firstEnter = YES;
    [self initData];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAV_HEIGHT, SCREEN.width, SCREEN.height - NAV_HEIGHT)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UIView * viewZero = [[UIView alloc]initWithFrame:CGRectZero];
    [_tableView setTableFooterView:viewZero];
    [self.view addSubview:_tableView];

}
- (int)random{
    int random = arc4random()%10+1;
    return random;
}
- (void)initData{
    for (int i=0; i<[self random]; i++) {
        Model * model = [[Model alloc]init];
        model.level = 1;
        model.name = [NSString stringWithFormat:@"一级:%d",i];
        [_dataArr addObject:model];
    }
    NSLog(@"%@",_dataArr);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    Model * model = cell.model;
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
                    
                    [indexSets addIndex:idx];
                    
                    modelLe2 = [_dataArr objectAtIndex:idx];
                    [arr2 addObject:modelLe2];
                }
                
                if (modelX.level == 3 ) {
                    for (int i = 0 ; i < arr2.count; i++) {
                        if (modelX.parentModel == arr2[i]) {
                            
                            [indexSets addIndex:idx];
                            
                            modelLe3 = [_dataArr objectAtIndex:idx];
                            [arr3 addObject:modelLe3];
                        }
                    }
                }
                
                if (modelX.level == 4) {
                    for (int i = 0; i < arr3.count; i++) {
                        if (modelX.parentModel == arr3[i]) {
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
                    
                    [indexSets addIndex:idx];
                    
                    modelLe3 = [_dataArr objectAtIndex:idx];
                    [arr3 addObject:modelLe3];
                }
                
                if (modelY.level == 4) {
                    for (int i = 0; i < arr3.count; i++) {
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
                    
                    [indexSets addIndex:idx];
                    
                    modelLe4 = [_dataArr objectAtIndex:idx];
                    [arr4 addObject:modelLe4];
                }
            }];
        }
        
        [_dataArr removeObjectsAtIndexes:indexSets];
    }
    else if ([_dicOpen objectForKey:[NSString stringWithFormat:@"%@",cell.model]] == nil) {
        model.isOpen = YES;
        NSLog(@"第一次点击该cell  :%@  level:%d",model.name, model.level);
        [_dicOpen setValue:model forKey:[NSString stringWithFormat:@"%@",cell.model]];
        NSLog(@"%@",_dicOpen);
        if (model.level == 1) {//点击一级添加
            for ( int i = 0; i < [self random]; i++) {
                Model * model2 = [Model initWithName:[NSString stringWithFormat:@"二级:%d",i] withLevel:2 withParentModel:model];
                [_dataArr insertObject:model2 atIndex:indexPath.row+1+i];
            }
        }
        else if (model.level == 2) {//点击二级添加
            for ( int i = 0; i < [self random]; i++) {
                Model * model3 = [Model initWithName:[NSString stringWithFormat:@"三级:%d",i] withLevel:3 withParentModel:model];
                [_dataArr insertObject:model3 atIndex:indexPath.row+1+i];
            }
        }
        else if (model.level == 3) {//点击三级添加
            for ( int i = 0; i < [self random]; i++) {
                Model * model4 = [Model initWithName:[NSString stringWithFormat:@"四级:%d",i] withLevel:4 withParentModel:model];
                [_dataArr insertObject:model4 atIndex:indexPath.row+1+i];
            }
        }
    }
    [_tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
