//
//  ViewController.m
//  collectionView
//
//  Created by zhangfuwei on 2018/3/12.
//  Copyright © 2018年 zhangfuwei. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalCollectionVC.h"
#import "VerticalCollectionVC.h"
#import "MixCollectionVC.h"
#import "FallsCollectionVC.h"

@interface ViewController ()
/** btn  */
@property (nonatomic, strong) UIButton *leftBtn;
/** btn  */
@property (nonatomic, strong) UIButton *rightBtn;
/** btn  */
@property (nonatomic, strong) UIButton *mixBtn;
/** btn  */
@property (nonatomic, strong) UIButton *fallsBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.leftBtn.frame = CGRectMake(15, 100, self.view.bounds.size.width-30, 20);
    self.rightBtn.frame = CGRectMake(15, 200, self.view.bounds.size.width-30, 20);
    self.mixBtn.frame = CGRectMake(15, 300, self.view.bounds.size.width-30, 20);
    self.fallsBtn.frame = CGRectMake(15, 400, self.view.bounds.size.width-30, 20);
    
    [self.view addSubview:self.fallsBtn];
    [self.view addSubview:self.leftBtn];
    [self.view addSubview:self.rightBtn];
    [self.view addSubview:self.mixBtn];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)btnClick:(UIButton *)sender {
    if (sender.tag == 0) {
        [self.navigationController pushViewController:[[HorizontalCollectionVC alloc] initWithCollectionViewLayout:[[UICollectionViewLayout alloc] init]] animated:YES];
    }else if (sender.tag ==1){
        [self.navigationController pushViewController:[[VerticalCollectionVC alloc] initWithCollectionViewLayout:[[UICollectionViewLayout alloc] init]] animated:YES];

    }else if (sender.tag ==2){
        [self.navigationController pushViewController:[[MixCollectionVC alloc] init] animated:YES];
        
    }else{
        [self.navigationController pushViewController:[[FallsCollectionVC alloc] init] animated:YES];

    }
}
-(UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_leftBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        _leftBtn.tag = 0;
        [_leftBtn setTitle:@"水平滚动的collectionView" forState:UIControlStateNormal];
        
    }
    return _leftBtn;
}

-(UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn.tag = 1;
        [_rightBtn setTitle:@"竖直滚动的collectionView" forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];

    }
    return _rightBtn;
}

-(UIButton *)mixBtn {
    if (!_mixBtn) {
        _mixBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_mixBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _mixBtn.tag = 2;
        [_mixBtn setTitle:@"水平竖直滚动的collectionView" forState:UIControlStateNormal];
        [_mixBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        
    }
    return _mixBtn;
}

-(UIButton *)fallsBtn {
    if (!_fallsBtn) {
        _fallsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fallsBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _fallsBtn.tag = 3;
        [_fallsBtn setTitle:@"瀑布流" forState:UIControlStateNormal];
        [_fallsBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    }
    return _fallsBtn;
}
@end
