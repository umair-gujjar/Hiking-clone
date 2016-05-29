//
//  CJRouteCollectionCell.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/29.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "CJRouteCollectionCell.h"
#import "UIImageView+WebCache.h"

@interface CJRouteCollectionCell ()

@property (weak, nonatomic) IBOutlet UILabel *trail_countLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation CJRouteCollectionCell

-(void)setModel:(CJRouteCollectionCellModel *)model
{
    _model = model;
    self.trail_countLabel.text = [NSString stringWithFormat:@"路线%@",model.trail_count];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"photo"]];
    self.trail_countLabel.layer.cornerRadius = 10;
    self.trail_countLabel.clipsToBounds = YES;
}

@end
