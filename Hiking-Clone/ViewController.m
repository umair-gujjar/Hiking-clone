//
//  ViewController.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/27.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "CJActivityHeaderView.h"
#import "CJActivityTableViewCell.h"

#define URL_ACTIVITY @"http://tubu.ibuzhai.com/rest/v3/activity/hot?&app_version=4.2.0&page_size=20&api_version=1&page=1&device_type=2"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *activityArrM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadData];
}

-(void)loadData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:URL_ACTIVITY parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
    if (indexPath.row == 0) {
        CJActivityHeaderView *cell = [tableView dequeueReusableCellWithIdentifier:@"Header"];
        return cell;
    }
    else{
        CJActivityCellModel *model = self.activityArrM[indexPath.row];
        CJActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.model = model;
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 190;
    }
    return 205;
}
- (IBAction)headerBtnClick:(UIButton *)sender {
    id subVC = [self.storyboard instantiateViewControllerWithIdentifier:@"subVC"];
    switch (sender.tag) {
        case 5:
        {
            [subVC setValue:@"http://tubu.ibuzhai.com/rest/v3/activities?&page_size=20&cur_page=1&sort=0&keywords=&device_type=2&app_version=4.2.0&is_recent=0&api_version=1" forKey:@"URL"];
        }
            break;
        case 10:
        {
            [subVC setValue:@"http://tubu.ibuzhai.com/rest/v3/activities?&page_size=20&cur_page=1&sort=0&keywords=%E5%91%A8%E6%9C%AB&device_type=2&app_version=4.2.0&is_recent=0&api_version=1" forKey:@"URL"];
        }
            break;
        case 20:
            [subVC setValue:@"http://tubu.ibuzhai.com/rest/v3/activities?&page_size=20&cur_page=1&sort=0&keywords=%E9%95%BF%E7%BA%BF&device_type=2&app_version=4.2.0&is_recent=0&api_version=1" forKey:@"URL"];
            break;
        case 30:
            [subVC setValue:@"http://tubu.ibuzhai.com/rest/v3/activities?&page_size=20&cur_page=1&sort=0&keywords=%E6%91%84%E5%BD%B1&device_type=2&app_version=4.2.0&is_recent=0&api_version=1" forKey:@"URL"];
            break;
        case 40:
            [subVC setValue:@"http://tubu.ibuzhai.com/rest/v3/activities?&page_size=20&cur_page=1&sort=0&keywords=%E5%85%A5%E9%97%A8&device_type=2&app_version=4.2.0&is_recent=0&api_version=1" forKey:@"URL"];
            break;
        case 50:
            [subVC setValue:@"http://tubu.ibuzhai.com/rest/v3/activities?&page_size=20&cur_page=1&sort=0&keywords=%E8%BF%9B%E9%98%B6&device_type=2&app_version=4.2.0&is_recent=0&api_version=1" forKey:@"URL"];
            break;
        case 60:
            [subVC setValue:@"http://tubu.ibuzhai.com/rest/v3/activities?&page_size=20&cur_page=1&sort=0&keywords=%E6%BA%AF%E6%BA%AA&device_type=2&app_version=4.2.0&is_recent=0&api_version=1" forKey:@"URL"];
            break;
        case 70:
            [subVC setValue:@"http://tubu.ibuzhai.com/rest/v3/activities?&page_size=20&cur_page=1&sort=0&keywords=%E4%BA%B2%E5%AD%90&device_type=2&app_version=4.2.0&is_recent=0&api_version=1" forKey:@"URL"];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:subVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
