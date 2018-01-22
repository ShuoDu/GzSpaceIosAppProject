//
//  MeController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MeController.h"
#import "MeHeadView.h"

@interface MeController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *myTableView;
}
@property(nonatomic,copy)NSArray *dataArray;
@end

@implementation MeController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.hidden = YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:213/255.0 green:25/255.0 blue:16/255.0 alpha:1];
    self.tabBarItem.title = @"我的";
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,-45, self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
//    myTableView.backgroundColor =  [UIColor colorWithRed:213/255.0 green:25/255.0 blue:16/255.0 alpha:1];
    myTableView.backgroundColor=[UIColor colorWithRed:235/255.0
                                               green:240/255.0
                                                blue:240/255.0
                                               alpha:1.0];
    myTableView.scrollEnabled = YES;
    [self.view addSubview:myTableView];
   
    MeHeadView *head = [MeHeadView ins];
    head.frame = CGRectMake(0, 0,myTableView.frame.size.width, 180);
    myTableView.tableHeaderView = head;
    self.dataArray = @[@"钱包",@"账单",@"订单",@"格子",@"收藏",@"设置",@"关于我们"];
}


#pragma mark - UITableViewDelaget
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, myTableView.frame.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    return cell;
}




@end
