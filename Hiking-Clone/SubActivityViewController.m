//
//  SubActivityViewController.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/28.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "SubActivityViewController.h"
#import "AFNetworking.h"
#import "CJActivityHeaderView.h"
#import "CJActivityTableViewCell.h"

@interface SubActivityViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *activityArrM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SubActivityViewController

-(void)viewDidLoad
{
    [self loadData];
}

-(void)loadData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:self.URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *arr = responseObject[@"activities"];
        //        NSError *error;
        for (NSDictionary *dict in arr) {
            CJActivityCellModel *model = [CJActivityCellModel activityCellModeWithDictionary:dict];
            [self.activityArrM addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure = %@",error);
    }];
}

-(NSMutableArray *)activityArrM
{
    if (_activityArrM == nil) {
        _activityArrM = [NSMutableArray array];
    }
    return _activityArrM;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.activityArrM.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJActivityCellModel *model = self.activityArrM[indexPath.row];
    CJActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subcell"];
    cell.model = model;
    return cell;
}

@end
