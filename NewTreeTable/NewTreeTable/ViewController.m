//
//  ViewController.m
//  NewTreeTable
//
//  Created by rhcf_wujh on 16/9/27.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import "ViewController.h"

#import "HeaderView.h"
#import "MainTableViewCell.h"

#import "SectionModel.h"


#import "SecondVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,weak) UITableView * tableView;

@property (nonatomic ,strong) NSMutableArray * sectionDatas;

//  [{s:[{},{}]} , ,, ] 
@end

@implementation ViewController

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray *)sectionDatas{
    if (!_sectionDatas) {
        _sectionDatas = [[NSMutableArray alloc]init];
        int y = [self random];
        for (int i = 0; i<y; i++) {
            SectionModel * model = [SectionModel randomModel];
            [_sectionDatas addObject:model];
        }
    }
    return _sectionDatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Example";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self sectionDatas];
    
    self.tableView.backgroundColor = [UIColor lightGrayColor];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderView * view = [HeaderView headerView:tableView];
    view.model = self.sectionDatas[section];
    __weak __typeof(self)weakSelf = self;
    view.headerViewClickBlock = ^(){
        NSLog(@"%@",view);
    };
    
    view.tag = 100+section;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionClick:)];
    [view addGestureRecognizer:tap];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell * cell = [MainTableViewCell mainTableViewCellWithTableView:tableView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.people.isOpen = !cell.people.isOpen;
    if (cell.people.isOpen) {
        [UIView animateWithDuration:0.3 animations:^{
            cell.iconIV.transform = CGAffineTransformMakeRotation(90 * M_PI/180.0);
        }];
    }else {
        [UIView animateWithDuration:0.3 animations:^{
            cell.iconIV.transform = CGAffineTransformIdentity;        }];
    }
    
    SecondVC * vc = [[SecondVC alloc]init];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:NO completion:nil];
    
}

- (void)sectionClick:(UITapGestureRecognizer *)tap{
    NSInteger tag = tap.view.tag;
    NSLog(@"%zi",tag);
}




- (int)random{
    int random = arc4random()%10+1;
    return random;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
