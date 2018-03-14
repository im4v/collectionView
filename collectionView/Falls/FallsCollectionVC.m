//
//  FallsCollectionVC.m
//  collectionView
//
//  Created by zhangfuwei on 2018/3/14.
//  Copyright © 2018年 zhangfuwei. All rights reserved.
//

#import "FallsCollectionVC.h"
#import "FallsLayout.h"

/** 复用id */
static NSString *const kFallsCellReuseID            = @"kFallsCellReuseID";

@interface FallsCollectionVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** 水平  */
@property (nonatomic, strong) FallsLayout *fallsLayout;

/** 水平  */
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation FallsCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --- delegate && dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFallsCellReuseID forIndexPath:indexPath];

    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    return cell;
}



#pragma mark --- Lazyload
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:self.fallsLayout];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
        _collectionView.showsHorizontalScrollIndicator = YES;
        _collectionView.scrollEnabled = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kFallsCellReuseID];
        
    }
    return _collectionView;
}

- (FallsLayout *)fallsLayout {
    if (!_fallsLayout) {
        _fallsLayout = [[FallsLayout alloc] init];
        _fallsLayout.sectionInset = UIEdgeInsetsMake(kPadding, kPadding, kPadding, kPadding);
        _fallsLayout.columnCount = 4;
        _fallsLayout.columnSpacing = kPadding;
        _fallsLayout.rowSpacing = kPadding;
        _fallsLayout.itemHeightBlock = ^CGFloat(CGFloat itemHeight, NSIndexPath *indexPath) {
            return arc4random_uniform(100)+20;
        };
    }
    return _fallsLayout;
}

@end
