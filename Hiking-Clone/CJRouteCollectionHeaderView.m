//
//  CJRouteCollectionHeaderView.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/29.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "CJRouteCollectionHeaderView.h"

@interface CJRouteCollectionHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;

@end

@implementation CJRouteCollectionHeaderView

-(void)setModel:(CJRouteCollectionSectionModel *)model
{
    _model = model;
    self.regionLabel.text = model.region;
}

@end
