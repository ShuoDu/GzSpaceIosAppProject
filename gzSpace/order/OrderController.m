//
//  OrderController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/22.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "OrderController.h"
#import "OrderOneCell.h"
static NSString *orderCellID = @"OrderOneCell";
@interface OrderController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView  *myTable;
@end

@implementation OrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单";
    [self addConfigView];
}

- (void)addConfigView {
    self.myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    [self.myTable registerNib:[UINib nibWithNibName:@"OrderOneCell" bundle:nil] forCellReuseIdentifier:orderCellID];
    self.myTable.backgroundColor = NewViewBack;
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    [self.view addSubview:self.myTable];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 124;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:orderCellID];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
