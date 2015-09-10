//
//  ShopCell.m
//  瀑布流
//
//  Created by Theshy on 15/9/9.
//  Copyright © 2015年 Theshy. All rights reserved.
//

#import "ShopCell.h"
#import <UIImageView+WebCache.h>
@interface ShopCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation ShopCell

- (void)setShopList:(shops *)shopList {
    _shopList = shopList;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shopList.img]];
    self.priceLabel.text = shopList.price;
}

@end
