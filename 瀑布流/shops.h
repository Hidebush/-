//
//  shops.h
//  瀑布流
//
//  Created by Theshy on 15/9/9.
//  Copyright © 2015年 Theshy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shops : NSObject

@property (nonatomic, assign) NSInteger h;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, assign) NSInteger w;


+ (instancetype) shopsWithDict:(NSDictionary *) dict;


+ (NSArray *) shops;


@end
