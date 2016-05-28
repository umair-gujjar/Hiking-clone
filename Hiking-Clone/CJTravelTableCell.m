//
//  CJTravelTableCell.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/28.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "CJTravelTableCell.h"
#import "UIImageView+WebCache.h"

@interface CJTravelTableCell ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImgView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *otherLabel;

@end

@implementation CJTravelTableCell


-(void)setModel:(CJTravelModel *)model
{
    _model = model;
    [self.bgImgView sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:@"photo"]];
    self.bottomLabel.text = [NSString stringWithFormat:@"%@ · %@天%@图 · by%@",model.start_date,model.total_days,model.photo_number,model.nickname];
    [self.userImgView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"photo"]];
    self.userImgView.layer.cornerRadius = 20;
    self.userImgView.clipsToBounds = YES;
    self.descriptionLabel.text = model.name;
    self.otherLabel.text = [NSString stringWithFormat:@"%@  %@  %@",model.view_count,model.fav_count,model.comment_count];
    
}

@end
