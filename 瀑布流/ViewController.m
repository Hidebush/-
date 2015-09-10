
//  ViewController.m
//  瀑布流
//
//  Created by Theshy on 15/9/9.
//  Copyright © 2015年 Theshy. All rights reserved.
//

#import "ViewController.h"
#import "shops.h"
#import "WaterFallLayout.h"
#import "ShopCell.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *dataList;
@property (weak, nonatomic) IBOutlet WaterFallLayout *layout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.layout.shopList = self.dataList;
    self.layout.columnCount = 3;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    

}

#pragma mark -数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    cell.shopList = self.dataList[indexPath.item    ];
    return cell;
}




- (NSArray *)dataList {
    if (_dataList == nil) {
        _dataList = [shops shops];
    }
    return _dataList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
