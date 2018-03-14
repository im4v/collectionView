//
//  FallsLayout.h
//  collectionView
//
//  Created by zhangfuwei on 2018/3/14.
//  Copyright © 2018年 zhangfuwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FallsLayout : UICollectionViewLayout
//总列数
@property (nonatomic, assign) NSInteger columnCount;
//列间距
@property (nonatomic, assign) NSInteger columnSpacing;
//行间距
@property (nonatomic, assign) NSInteger rowSpacing;
//section到collectionView的边距
@property (nonatomic, assign) UIEdgeInsets sectionInset;
//保存每一列最大y值的数组
@property (nonatomic, strong) NSMutableDictionary *maxYDic;
//保存每一个item的attributes的数组
@property (nonatomic, strong) NSMutableArray *attributesArray;

@property (nonatomic, strong) CGFloat(^itemHeightBlock)(CGFloat itemHeight,NSIndexPath *indexPath);

@end
