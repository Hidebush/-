//
//  shops.m
//  瀑布流
//
//  Created by Theshy on 15/9/9.
//  Copyright © 2015年 Theshy. All rights reserved.
//

#import "shops.h"

@implementation shops


+ (instancetype)shopsWithDict:(NSDictionary *)dict {
    
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}




+ (NSArray *)shops
{
    // 获取绝对路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"plist"];
    //  加载plist
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    //  把数组中的字典转模型
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:dictArray.count];
    for (NSDictionary *dict  in dictArray) {
        
        shops *shop = [self shopsWithDict:dict];
        [arrayM addObject:shop];
    }
    
    return arrayM;
}

@end
