//
//  RouteViewController.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/29.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "RouteViewController.h"
#import "AFNetworking.h"
#import "CJRouteCollectionSectionModel.h"
#import "CJRouteCollectionCell.h"
#import "CJRouteCollectionHeaderView.h"
#import "UIImageView+WebCache.h"

@interface RouteViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property(nonatomic,copy)NSString *URL;
@property(nonatomic,copy)NSString *tableURL;
@property(nonatomic,copy)NSString *collectionURL;

@property (weak, nonatomic) IBOutlet UIView *btnView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *sliderView;

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,weak) IBOutlet UICollectionView *collectionView;

@property(nonatomic,strong)NSMutableArray *tableDataArrM;
@property(nonatomic,strong)NSMutableArray *collectionDataArrM;
@property(nonatomic,strong)NSMutableArray *dataArrM;

@end

@implementation RouteViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionURL = @"http://tubu.ibuzhai.com/rest/v2/trail/regions?app_version=2.4.5&device_type=1";
    self.tableURL = @"http://tubu.ibuzhai.com/rest/v1/trail/types?app_version=2.4.5&device_type=1";
    self.URL = self.collectionURL;
    [self createUI];
    [self loadData];
    }

-(void)loadData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:self.URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([self.URL isEqualToString:self.collectionURL]) {
            for (NSDictionary *dict in responseObject[@"regions"]) {
                CJRouteCollectionSectionModel *sectionModel = [[CJRouteCollectionSectionModel alloc] initWithDictionary:dict error:nil];
                [self.collectionDataArrM addObject:sectionModel];
            }
            [self.collectionView reloadData];
        }else if ([self.URL isEqualToString:self.tableURL])
        {
            for (NSDictionary *dict in responseObject[@"types"]) {
                [self.tableDataArrM addObject:dict[@"url"]];
            }
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void)createUI
{
    self.scrollView.contentSize = CGSizeMake(375*2, 0);
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(375, 0, 375, 510) style:UITableViewStylePlain];
    [self.scrollView addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
/**************************************/
//table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableDataArrM.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"RouteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.contentView.backgroundColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:0.3];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 355, 190)];
    [imgView sd_setImageWithURL:[NSURL URLWithString:self.tableDataArrM[indexPath.row]] placeholderImage:[UIImage imageNamed:@"photo"]];
    [cell.contentView addSubview:imgView];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
/**************************************/
//collectionView
#pragma mark -- collectionView cell number
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.collectionDataArrM.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collectionDataArrM[section] province].count;
}
#pragma mark -- collectionView cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CJRouteCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"routecollectioncell" forIndexPath:indexPath];
    CJRouteCollectionSectionModel *sectionModel = self.collectionDataArrM[indexPath.section];
    CJRouteCollectionCellModel *model = sectionModel.province[indexPath.row];
    cell.model = model;
    return cell;
}
#pragma mark -- collectionView headerView size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(375, 20);
}
#pragma mark -- collectionView headerView preference
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        CJRouteCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CJRouteCollectionHeaderView" forIndexPath:indexPath];
        if (self.collectionDataArrM.count) {
            CJRouteCollectionSectionModel *model = self.collectionDataArrM[indexPath.section];
            headerView.model = model;
        }
        return headerView;
        
    }
    return nil;
}
/**************************************/
//scrollView
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = self.scrollView.contentOffset.x/(int)self.view.frame.size.width;
    for (UIButton *btn in self.btnView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.selected = NO;
            NSInteger temp = btn.frame.origin.x/(NSInteger)btn.frame.size.width;
            if ( temp == index) {
                btn.selected = YES;
                [self sliderViewAnimate:btn];
            }
        }
    }
    [self reloadData:index];
    
}
- (IBAction)btnClick:(UIButton *)sender {
    for (UIButton *btn in self.btnView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.selected = NO;
        }
    }
    [self sliderViewAnimate:sender];
    NSInteger index = sender.frame.origin.x/(int)sender.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake( index* self.view.frame.size.width, 0) animated:YES];
    [self reloadData:index];
    sender.selected = YES;
}

-(void)sliderViewAnimate:(UIButton *)btn
{
    [UIView animateWithDuration:0.3f animations:^{
        self.sliderView.frame = CGRectMake(btn.frame.origin.x, 42, 187, 2);
    }];
}

-(void)reloadData:(NSInteger)index
{
    if (index) {
        self.URL = self.tableURL;
        [self.tableView reloadData];
    }else
    {
        self.URL = self.collectionURL;
        [self.collectionView reloadData];
    }
    [self loadData];
}

-(NSMutableArray *)tableDataArrM
{
    if (_tableDataArrM == nil) {
        _tableDataArrM = [NSMutableArray array];
    }
    return _tableDataArrM;
}
-(NSMutableArray *)collectionDataArrM
{
    if (_collectionDataArrM == nil) {
        _collectionDataArrM = [NSMutableArray array];
    }
    return _collectionDataArrM;
}
@end
