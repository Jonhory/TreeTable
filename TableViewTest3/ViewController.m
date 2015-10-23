//
//  ViewController.m
//  TableViewTest3
//
//  Created by wujh on 15/10/19.
//  Copyright (c) 2015年 南京. All rights reserved.
//

#define SCREEN [UIScreen mainScreen].bounds.size

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "Model.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic ,strong )NSMutableArray * dataArr;
@property (nonatomic,strong)NSMutableDictionary * dicOpen;



@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArr = [NSMutableArray array];
    _dicOpen = [NSMutableDictionary dictionary];
    
    [self initData];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, SCREEN.width, SCREEN.height-100)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UIView * viewZero = [[UIView alloc]initWithFrame:CGRectZero];
    [_tableView setTableFooterView:viewZero];
    [self.view addSubview:_tableView];

}
- (void)initData{
    for (int i=0; i<4; i++) {
        Model * model = [[Model alloc]init];
        model.level = 1;
        model.name = [NSString stringWithFormat:@"%d",i];
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
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell * cell = [MyTableViewCell cellWithTableView:tableView];
    cell.model = _dataArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyTableViewCell * cell = (MyTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    Model * model = cell.model;
    if ([_dicOpen objectForKey:[NSString stringWithFormat:@"%@",cell.model]] == model) {
        NSLog(@"第二次点击该cell  cell Name :%@",model);
        [_dicOpen setValue:nil forKey:[NSString stringWithFormat:@"%@",cell.model]];
        
        NSMutableIndexSet * indexSets = [[NSMutableIndexSet alloc]init];//
        
        Model * modelLevel2 = [[Model alloc]init];//二级的模型 是三级的parentModel
        NSMutableArray * arr2 = [NSMutableArray array];//二级的数组 存二级的模型
        
        Model * modelLevel3 = [[Model alloc]init];//三级的模型 是四级的parentModel
        NSMutableArray * arr3 = [NSMutableArray array];//三级的数组 存三级的模型
        
        Model * modelLevel4 = [[Model alloc]init];//四级的模型 是五级的parentModel
        NSMutableArray * arr4 = [NSMutableArray array];//四级的数组 存四级的模型
        
        Model * modelLevel5 = [[Model alloc]init];//五级的模型 是六级的parentModel
        NSMutableArray * arr5 = [NSMutableArray array];//五级的数组 存五级的模型
        
        
        __block Model * modelLe2 = modelLevel2;
        __block Model * modelLe3 = modelLevel3;
        __block Model * modelLe4 = modelLevel4;
        __block Model * modelLe5 = modelLevel5;
        
        if (model.level ==1 ) {//点击一级分组删除
            
            [_dataArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                Model * modelX = [_dataArr objectAtIndex:idx];
                
                if (modelX.level ==2 && modelX.parentModel == model  ) {
                    
                    [indexSets addIndex:idx];
                    
                    modelLe2 = [_dataArr objectAtIndex:idx];
                    [arr2 addObject:modelLe2];
                }
                
                if (modelX.level ==3 ) {
                    for (int i =0 ; i<arr2.count; i++) {
                        if (modelX.parentModel == arr2[i]) {
                            
                            [indexSets addIndex:idx];
                            
                            modelLe3 = [_dataArr objectAtIndex:idx];
                            [arr3 addObject:modelLe3];
                        }
                    }
                }
                if (modelX.level == 4) {
                    for (int i=0; i<arr3.count; i++) {
                        if (modelX.parentModel == arr3[i]) {
                            [indexSets addIndex:idx];
                            
                            modelLe4 = [_dataArr objectAtIndex:idx];
                            [arr4 addObject:modelLe4];
                        }
                    }
                }
                if (modelX.level == 5) {
                    for (int i=0; i<arr4.count; i++) {
                        if (modelX.parentModel == arr4[i]) {
                            [indexSets addIndex:idx];
                            
                            modelLe5 = [_dataArr objectAtIndex:idx];
                            [arr5 addObject:modelLe5];
                        }
                    }
                }
                if (modelX.level == 6) {
                    for (int i=0; i<arr5.count; i++) {
                        if (modelX.parentModel == arr5[i]) {
                            [indexSets addIndex:idx];
                        }
                    }
                }
            }];
        }
        
        if (model.level == 2   ) {//点击二级分组删除
            
            [_dataArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                Model * modelY = [_dataArr objectAtIndex:idx];
                if (modelY.level == 3 && modelY.parentModel == model ) {
                    
                    [indexSets addIndex:idx];
                    
                    modelLe3 = [_dataArr objectAtIndex:idx];
                    [arr3 addObject:modelLe3];
                }
                if (modelY.level == 4) {
                    for (int i=0; i<arr3.count; i++) {
                        if (modelY.parentModel == arr3[i]) {
                            [indexSets addIndex:idx];
                            
                            modelLe4 = [_dataArr objectAtIndex:idx];
                            [arr4 addObject:modelLe4];
                        }
                    }
                }
                if (modelY.level == 5) {
                    for (int i=0; i<arr4.count; i++) {
                        
                        if (modelY.parentModel == arr4[i]) {
                            
                            [indexSets addIndex:idx];
                            
                            modelLe5 = [_dataArr objectAtIndex:idx];
                            [arr5 addObject:modelLe5];
                        }
                    }
                }
                if (modelY.level == 6) {
                    for (int i=0; i<arr5.count; i++) {
                        
                        if (modelY.parentModel == arr5[i]) {
                            
                            [indexSets addIndex:idx];
                        }
                    }
                }
            }];
        }
        
        if (model.level == 3   ) {//点击三级分组删除
            
            [_dataArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                Model * modelY = [_dataArr objectAtIndex:idx];
                if (modelY.level == 4 && modelY.parentModel == model ) {
                    
                    [indexSets addIndex:idx];
                    
                    modelLe4 = [_dataArr objectAtIndex:idx];
                    [arr4 addObject:modelLe4];
                }
                if (modelY.level == 5) {
                    for (int i=0; i<arr4.count; i++) {
                        if (modelY.parentModel == arr4[i]) {
                            [indexSets addIndex:idx];
                            modelLe5 = [_dataArr objectAtIndex:idx];
                            [arr5 addObject:modelLe5];
                        }
                    }
                }
                if (modelY.level == 6) {
                    for (int i=0; i<arr5.count; i++) {
                        
                        if (modelY.parentModel == arr5[i]) {
                            
                            [indexSets addIndex:idx];
                        }
                    }
                }
                
            }];
        }
        
        if (model.level == 4   ) {//点击四级分组删除
            
            [_dataArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                Model * modelY = [_dataArr objectAtIndex:idx];
                if (modelY.level == 5 && modelY.parentModel == model ) {
                    
                    [indexSets addIndex:idx];
                    
                    modelLe5 = [_dataArr objectAtIndex:idx];
                    [arr5 addObject:modelLe5];
                }
                if (modelY.level == 6) {
                    for (int i=0; i<arr5.count; i++) {
                        
                        if (modelY.parentModel == arr5[i]) {
                            
                            [indexSets addIndex:idx];
                        }
                    }
                }
                
            }];
        }
        
        if (model.level == 5   ) {//点击五级分组删除
            
            [_dataArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                Model * modelY = [_dataArr objectAtIndex:idx];
                if (modelY.level == 6 && modelY.parentModel == model ) {
                    
                    [indexSets addIndex:idx];
                }
            }];
        }
        
        
        [_dataArr removeObjectsAtIndexes:indexSets];
        [_tableView reloadData];
        
        return ;
    }
    else if ([_dicOpen objectForKey:[NSString stringWithFormat:@"%@",cell.model]] == nil) {
        NSLog(@"第一次点击该cell  :%@",model);
        [_dicOpen setValue:model forKey:[NSString stringWithFormat:@"%@",cell.model]];
        NSLog(@"%@",_dicOpen);
        if (model.level ==1) {//点击一级添加
            for ( int i=0; i<2; i++) {
                Model * model2 = [Model initWithName:[NSString stringWithFormat:@"二级:%d",i] withLevel:2 withParentModel:model];
                [_dataArr insertObject:model2 atIndex:indexPath.row+1+i];
            }
            [_tableView reloadData];
        }
        
        if (model.level ==2) {//点击二级添加
            for ( int i=0; i<2; i++) {
                Model * model3 = [Model initWithName:[NSString stringWithFormat:@"三级:%d",i] withLevel:3 withParentModel:model];
                [_dataArr insertObject:model3 atIndex:indexPath.row+1+i];
            }
            [_tableView reloadData];
        }
        
        if (model.level == 3) {//点击三级添加
            for (int i = 0; i<3; i++) {
                Model * model4 = [Model initWithName:[NSString stringWithFormat:@"四级:%d",i] withLevel:4 withParentModel:model];
                [_dataArr insertObject:model4 atIndex:indexPath.row+1+i];
            }
            [_tableView reloadData];
        }
        if (model.level == 4) {//点击四级添加
            for (int i = 0; i<3; i++) {
                //                Model * model4 = [[Model alloc]init];
                //                model4.level = 4;
                //                model4.parentModel = model;
                //                model4.name = [NSString stringWithFormat:@"四级:%d",i];
                Model * model5 = [Model initWithName:[NSString stringWithFormat:@"五级:%d",i] withLevel:5 withParentModel:model];
                [_dataArr insertObject:model5 atIndex:indexPath.row+1+i];
            }
            [_tableView reloadData];
        }
        if (model.level == 5) {//点击五级添加
            for (int i = 0; i<3; i++) {
                Model * model6 = [Model initWithName:[NSString stringWithFormat:@"六级:%d",i] withLevel:6 withParentModel:model];
                [_dataArr insertObject:model6 atIndex:indexPath.row+1+i];
            }
            [_tableView reloadData];
        }
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
