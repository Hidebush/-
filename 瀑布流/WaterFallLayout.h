//
//  WaterFallLayout.h
//  瀑布流
//
//  Created by Theshy on 15/9/9.
//  Copyright © 2015年 Theshy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterFallLayout : UICollectionViewFlowLayout
@property (nonatomic, assign) int columnCount;
@property (nonatomic, strong) NSArray *shopList;
@end
