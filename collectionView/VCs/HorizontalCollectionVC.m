//
//  HorizontalCollectionVC.m
//  collectionView
//
//  Created by zhangfuwei on 2018/3/12.
//  Copyright © 2018年 zhangfuwei. All rights reserved.
//

#import "HorizontalCollectionVC.h"

@interface HorizontalCollectionVC ()<UICollectionViewDelegateFlowLayout>
/** layout  */
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation HorizontalCollectionVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"水平方向滚动";
//    self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.collectionView.collectionViewLayout = self.flowLayout;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 3) {
        return UIEdgeInsetsMake(kPadding, kPadding, kPadding, kPadding);
    }
    return UIEdgeInsetsMake(kPadding, kPadding, kPadding, 0);
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-kPadding*5)/4, (self.view.bounds.size.height-64-kPadding*5)/4);
        _flowLayout.sectionInset = UIEdgeInsetsMake(kPadding, kPadding, kPadding, 0);
        _flowLayout.minimumLineSpacing = kPadding;
        _flowLayout.minimumInteritemSpacing = kPadding;
    }
    return _flowLayout;
}
@end
