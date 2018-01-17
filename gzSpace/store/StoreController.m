//
//  StoreController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/12.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "StoreController.h"

@interface StoreController ()

@end

@implementation StoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";//列出好的商品
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shopping_car"] style:(UIBarButtonItemStylePlain) target:nil action:nil];
    self.navigationItem.rightBarButtonItem = right;
}



@end
