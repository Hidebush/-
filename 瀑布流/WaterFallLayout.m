//
//  WaterFallLayout.m
//  瀑布流
//
//  Created by Theshy on 15/9/9.
//  Copyright © 2015年 Theshy. All rights reserved.
//

#import "WaterFallLayout.h"
#import "shops.h"

@interface WaterFallLayout ()
@property (nonatomic, strong) NSArray *layoutAttributes;
@end

@implementation WaterFallLayout



- (void)prepareLayout {
    
    CGFloat contentW = self.collectionViewContentSize.width - self.sectionInset.left - self.sectionInset.right;
    CGFloat itemW = (contentW - (self.columnCount - 1) * self.minimumInteritemSpacing) / self.columnCount;
    [self calalayout:itemW];


}


- (void)calalayout:(CGFloat)itemW {
    CGFloat colHeight[self.columnCount];
    for (int i=0; i<self.columnCount; i++) {
        colHeight[i] = self.sectionInset.top;
    }
    CGFloat sumHeight = 0;
    int index = 0;
    NSMutableArray *arrayM = [NSMutableArray array];
    for (shops *shop in self.shopList) {
        CGFloat itemH = [self itemHWithSize:CGSizeMake(shop.w, shop.h) itemW:itemW];
        sumHeight += itemH;
//        int col = index % self.columnCount;
        int col = [self shortest:colHeight];
        CGFloat X = self.sectionInset.left + col * (itemW + self.minimumInteritemSpacing);
        CGFloat Y = colHeight[col];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        att.frame = CGRectMake(X, Y, itemW, itemH);
        [arrayM addObject:att];
        colHeight[col] += itemH + self.minimumLineSpacing;
        index++;
    }
    self.itemSize = CGSizeMake(itemW, sumHeight/self.shopList.count);
    
    self.layoutAttributes = arrayM.copy;
}

- (CGFloat)itemHWithSize:(CGSize)size itemW:(CGFloat)itemW {
    
    return size.height * itemW/size.width;
}

- (int)shortest:(CGFloat *)colHeight {
    float min = MAXFLOAT;
    int col = 0;
    for (int i = 0; i < self.columnCount; i++) {
        if (colHeight[i] < min) {
            min = colHeight[i];
            col = i;
        }
    }
    return col;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {

   
    return self.layoutAttributes;
    
}


@end
