//
//  SubActivityViewController.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/28.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "SubActivityViewController.h"
#import "CJTools.h"
#import "AFNetworking.h"
#import "CJActivityHeaderView.h"
#import "CJActivityTableViewCell.h"

@interface SubActivityViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *subactivityArrM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SubActivityViewController

-(void)viewDidLoad
{
    NSData *data = [CJTools toolTogetData:self.identifier];
    if (data.length) {
        self.subactivityArrM = [CJTools toolTogetData:self.identifier];
        [self.tableView reloadData];
    }
    [self loadData];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
}

-(void)loadData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:self.URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.subactivityArrM removeAllObjects];
        NSArray *arr = responseObject[@"activities"];
        //        NSError *error;
        for (NSDictionary *dict in arr) {
            CJActivityCellModel *model = [CJActivityCellModel activityCellModeWithDictionary:dict];
            [self.activityArrM addObject:model];
        }
        //保存缓存
        [CJTools toolToSaveWithData:self.activityArrM withIdentifier:self.identifier];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure = %@",error);
    }];
}

-(NSMutableArray *)activityArrM
{
    if (_subactivityArrM == nil) {
        _subactivityArrM = [NSMutableArray array];
    }
    return _subactivityArrM;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subactivityArrM.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJActivityCellModel *model = self.subactivityArrM[indexPath.row];
    CJActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subcell"];
    cell.model = model;
    return cell;
}

@end
