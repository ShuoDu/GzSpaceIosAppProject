//
//  MainController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MainController.h"
#import "MainHeadView.h"
#import "MainOneCell.h"
#import "MainTwoCell.h"
static NSString *oneCellID = @"MainOneCell";
static NSString *twoCellID = @"MainTwoCell";
@interface MainController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *myTableView;
}
@end

@implementation MainController

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"格子空间";
    self.tabBarItem.title = @"首页";
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"北京市" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = left;
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"message"] style:(UIBarButtonItemStylePlain) target:nil action:nil];
    self.navigationItem.rightBarButtonItem = right;
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-114)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"MainOneCell" bundle:nil] forCellReuseIdentifier:oneCellID];
     [myTableView registerNib:[UINib nibWithNibName:@"MainTwoCell" bundle:nil] forCellReuseIdentifier:twoCellID];
    [self.view addSubview:myTableView];
  
}


#pragma mark - UITableViewDelaget
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

// 返回组头部view的高度

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
    
}
//
////返回每组头部view
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//    UIView *headerView = [[UIView alloc]init];
//    headerView.backgroundColor = [UIColor colorWithRed:213/255.0 green:25/255.0 blue:16/255.0 alpha:1];
//    UILabel *label = [[UILabel alloc]init];
//    label.textColor = [UIColor whiteColor];
//    label.font = [UIFont systemFontOfSize:13];
//    label.frame = CGRectMake(15, 0, self.view.frame.size.width-30, 40);
//    label.textAlignment = NSTextAlignmentCenter;
//    [headerView addSubview:label];
//
//    if(section == 0) {
//
//        label.text = @"------ 人气店铺 ------";
//
//
//    }else if (section == 1) {
//        label.text = @"------ 产品首体验 ------";
//    }
//    else{
//
//        label.text = @"------ 人气商品 ------";
//
//    }
//
//    return headerView;
//
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:oneCellID];
   
    if (indexPath.section == 0) {
        MainOneCell *cellOne = [tableView dequeueReusableCellWithIdentifier:oneCellID];
        //    cell.backgroundColor = [UIColor colorWithRed:235/255.0
        //                                           green:240/255.0
        //                                            blue:240/255.0
        //                                           alpha:1.0];
//        cellOne.backgroundColor = [UIColor colorWithRed:213/255.0 green:25/255.0 blue:16/255.0 alpha:1];
        
        cell = cellOne;
    }
    else if (indexPath.section == 1) {
        MainTwoCell * cellTwo = [tableView dequeueReusableCellWithIdentifier:twoCellID];
            cell.backgroundColor = [UIColor colorWithRed:235/255.0
                                                   green:240/255.0
                                                    blue:240/255.0
                                                   alpha:1.0];
         cell  = cellTwo;
        
    } else {
        MainTwoCell *cellThree = [tableView dequeueReusableCellWithIdentifier:twoCellID];
        //    cell.backgroundColor = [UIColor colorWithRed:235/255.0
        //                                           green:240/255.0
        //                                            blue:240/255.0
        //                                           alpha:1.0];
//        cellThree.backgroundColor = [UIColor colorWithRed:213/255.0 green:25/255.0 blue:16/255.0 alpha:1];
        cell = cellThree;
   
    }
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

@end
