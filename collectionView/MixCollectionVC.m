//
//  MixCollectionVC.m
//  collectionView
//
//  Created by zhangfuwei on 2018/3/12.
//  Copyright © 2018年 zhangfuwei. All rights reserved.
//

#import "MixCollectionVC.h"

#define SCREEN_WIDTH self.view.bounds.size.width
#define SCREEN_HEIGHT (self.view.bounds.size.height-64)
static CGFloat const kPaddingBig            = 50;

static CGFloat const kPadding            = 15;

@interface MixCollectionVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/** 水平  */
@property (nonatomic, strong) UICollectionViewFlowLayout *hFlowLayout;
/** 竖直  */
@property (nonatomic, strong) UICollectionViewFlowLayout *vFlowLayout;


/** 水平  */
@property (nonatomic, strong) UICollectionView *hCollectionView;
/** 竖直  */
@property (nonatomic, strong) UICollectionView *vCollectionView;

@end

@implementation MixCollectionVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"水平竖直collectionView";
    self.automaticallyAdjustsScrollViewInsets
    self.view.backgroundColor = [UIColor blueColor];
//    UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kPadding)];
//    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2+kPadding, SCREEN_WIDTH, kPadding)];
//    lab1.text = @"HorizontalVC";
//    lab1.textColor = [UIColor purpleColor];
//
//    lab2.text = @"VerticalVC";
//    lab2.textColor = [UIColor purpleColor];
//
//
//    [self.view addSubview:lab2];
//    [self.view addSubview:lab1];
    [self.view addSubview:self.hCollectionView];
    [self.view addSubview:self.vCollectionView];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIColor *color ;
    switch (indexPath.section) {
        case 0:
            color = [UIColor redColor];
            break;
        case 1:
            color = [UIColor greenColor];
            break;
        case 2:
            color = [UIColor brownColor];
            break;
        case 3:
            color = [UIColor blueColor];
            break;
    }
   
    
    cell.backgroundColor = color;
    
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (collectionView.tag == 1001) { // 水平
        if (section == 3) {
            return UIEdgeInsetsMake(kPadding, kPadding, kPadding, kPadding);
        }
        return UIEdgeInsetsMake(kPadding, kPadding, kPadding, 0);
    }else { // 竖直
        if (section == 3) {
            return UIEdgeInsetsMake(kPadding, kPadding, kPadding, kPadding);
        }
        return UIEdgeInsetsMake(kPadding, kPadding, 0, kPadding);
    }
}
// MARK: -------collectionView
- (UICollectionViewFlowLayout *)hFlowLayout {
    if (!_hFlowLayout) {
        _hFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        _hFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _hFlowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-kPadding*5)/4, (SCREEN_HEIGHT/2-kPadding*5)/4);
        _hFlowLayout.sectionInset = UIEdgeInsetsMake(kPadding, kPadding, kPadding, 0);
        _hFlowLayout.minimumLineSpacing = kPadding;
        _hFlowLayout.minimumInteritemSpacing = kPadding;
    }
    return _hFlowLayout;
}

- (UICollectionViewFlowLayout *)vFlowLayout {
    if (!_vFlowLayout) {
        _vFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        _vFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _vFlowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-kPadding*5)/4, (SCREEN_HEIGHT/2-kPadding*5)/4);
        _vFlowLayout.sectionInset = UIEdgeInsetsMake(kPadding, kPadding, kPadding, kPadding);
        _vFlowLayout.minimumLineSpacing = kPadding;
        _vFlowLayout.minimumInteritemSpacing = kPadding;
    }
    return _vFlowLayout;
}

- (UICollectionView *)hCollectionView {
    if (!_hCollectionView) {
        _hCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT/2) collectionViewLayout:self.hFlowLayout];
//        _hCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _hCollectionView.backgroundColor = [UIColor lightGrayColor];
        _hCollectionView.showsHorizontalScrollIndicator = YES;
        _hCollectionView.scrollEnabled = YES;
        _hCollectionView.tag = 1001;
        _hCollectionView.delegate = self;
        _hCollectionView.dataSource = self;
        [_hCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

    }
    return _hCollectionView;
}

- (UICollectionView *)vCollectionView {
    if (!_vCollectionView) {
        _vCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2+65, SCREEN_WIDTH, SCREEN_HEIGHT/2) collectionViewLayout:self.vFlowLayout];
//        _vCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _vCollectionView.backgroundColor = [UIColor lightGrayColor];
        _vCollectionView.showsVerticalScrollIndicator = YES;
        _vCollectionView.scrollEnabled = YES;
        _vCollectionView.tag = 1002;
        _vCollectionView.delegate = self;
        _vCollectionView.dataSource = self;
        [_vCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    return _vCollectionView;
}
@end
