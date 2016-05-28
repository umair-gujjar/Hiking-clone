//
//  TravelViewController.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/28.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "TravelViewController.h"
#import "CJTravelTableCell.h"
#import "AFNetworking.h"

@interface TravelViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *dataArrM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TravelViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
}
-(void)loadData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://tubu.ibuzhai.com/rest/v1/travelog/recommends?app_version=2.4.5&device_type=1&page=1&page_size=20" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *dict in responseObject[@"logs"]) {
            CJTravelModel *model = [[CJTravelModel alloc] initWithDictionary:dict error:nil];
            [self.dataArrM addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(NSMutableArray *)dataArrM
{
    if (_dataArrM == nil) {
        _dataArrM = [NSMutableArray array];
    }
    return _dataArrM;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArrM.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJTravelTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"travel"];
    CJTravelModel *model = self.dataArrM[indexPath.row];
    cell.model = model;
    return cell;
}

@end
