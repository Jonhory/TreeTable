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

@property (nonatomic ,strong) UIButton * backBtn;

@end

@implementation SecondVC

- (instancetype)init{
    self = [super init];
    if (self) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    return self;
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

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 44, 44)];
        _backBtn.backgroundColor = [UIColor greenColor];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:1.0 animations:^{
        self.bgView.alpha = 1.0;
        self.bgView.frame = self.view.bounds;

    } completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
        self.view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.backBtn];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    self.title = @"second";
    
    [self.view addSubview:self.bgView];
    
    // Do any additional setup after loading the view.
}


- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc{
    NSLog(@"%@",_bgView);
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
