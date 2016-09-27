//
//  SecondVC.m
//  NewTreeTable
//
//  Created by rhcf_wujh on 16/9/27.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@property (nonatomic ,strong) UIView * bgView;

@end

@implementation SecondVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:1.0 animations:^{
        self.bgView.alpha = 1.0;
        self.bgView.frame = self.view.bounds;
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    self.title = @"second";
    
    [self.view addSubview:self.bgView];
    
    // Do any additional setup after loading the view.
}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
        _bgView.center = self.view.center;
        _bgView.backgroundColor = [UIColor greenColor];
        _bgView.alpha = 0.0;
    }
    return _bgView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
