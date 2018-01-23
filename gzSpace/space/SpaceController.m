//
//  SpaceController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/12.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "SpaceController.h"
#import "MainOneCell.h"
#import "SpaceDetailController.h"
static NSString *oneCellID = @"MainOneCell";
@interface SpaceController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *myTableView;
  
}
@property (nonatomic,strong)UISearchBar *searchBar;
@end

@implementation SpaceController

- (void) viewWillDisappear:(BOOL)animated {
    [self.searchBar removeFromSuperview];
}

- (void) viewWillAppear:(BOOL)animated {
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(100, 14,210, 12)];
    self.searchBar.placeholder = @"搜索您要找的店铺或商品";
    //一下代码为修改placeholder字体的颜色和大小
    UITextField * searchField = [self.searchBar valueForKey:@"_searchField"];
    [searchField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.showsCancelButton = NO;
    self.searchBar.backgroundColor =[UIColor colorWithRed:255/255.0 green:100/255.0 blue:59/255.0 alpha:1];
    [self.navigationController.navigationBar addSubview:self.searchBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addConfigView];
    [self loadData];
}

- (void)loadData {
    NSString *url = @"http://127.0.0.1:8080/store/list/";
    [CYXHttpRequest get:url params:nil success:^(id responseObj) {
         NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableLeaves error:nil];
         DLog(@"%@",weatherDic);
    } failure:^(NSError *error) {
        
    }];
}

- (void)addConfigView {
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"格子铺" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shopping_car"] style:(UIBarButtonItemStylePlain) target:nil action:nil];
      self.navigationItem.rightBarButtonItem = right;
    
    self.view.backgroundColor=[UIColor colorWithRed:235/255.0
                                                green:240/255.0
                                                 blue:240/255.0
                                                alpha:1.0];
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-114)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = [UIColor colorWithRed:235/255.0
                                                  green:240/255.0
                                                   blue:240/255.0
                                                  alpha:1.0];
    [myTableView registerNib:[UINib nibWithNibName:@"MainOneCell" bundle:nil] forCellReuseIdentifier:oneCellID];
    [self.view addSubview:myTableView];
    
}

#pragma mark - UITableViewDelaget
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SpaceDetailController *spaceDetail  = [[SpaceDetailController alloc]init];
    spaceDetail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:spaceDetail animated:YES];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

        MainOneCell *cellOne = [tableView dequeueReusableCellWithIdentifier:oneCellID];
        cellOne.backgroundColor = [UIColor colorWithRed:235/255.0
                                                   green:240/255.0
                                                    blue:240/255.0
                                                   alpha:1.0];
        return cellOne;
}


@end
