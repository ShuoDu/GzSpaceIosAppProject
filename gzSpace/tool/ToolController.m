//
//  ToolController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/20.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "ToolController.h"
#import "UseGzController.h"
#import "UseGzJiaController.h"
#import "ScanController.h"
@interface ToolController ()

@end

@implementation ToolController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)cancleAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)oneAction:(id)sender {
    UseGzController *useGz = [[UseGzController alloc]init];
    UINavigationController *useGzNav = [[UINavigationController alloc]initWithRootViewController:useGz];
    [self presentViewController:useGzNav animated:YES completion:nil];
}

- (IBAction)twoAction:(id)sender {
    ScanController *scanView = [[ScanController alloc]init];
    UINavigationController *scanNav = [[UINavigationController alloc]initWithRootViewController:scanView];
    [self presentViewController:scanNav animated:YES completion:nil];
   
}

- (IBAction)threeAction:(id)sender {
    UseGzJiaController *useGz = [[UseGzJiaController alloc]init];
    UINavigationController *useGzjNav = [[UINavigationController alloc]initWithRootViewController:useGz];
    [self presentViewController:useGzjNav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
