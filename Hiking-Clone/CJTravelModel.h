//
//  CJTravelModel.h
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/28.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "JSONModel.h"

@interface CJTravelModel : JSONModel

@property(nonatomic,copy)NSString *cover;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,strong)NSNumber *photo_number;
@property(nonatomic,copy)NSString *start_date;
@property(nonatomic,copy)NSString *total_days;
@property(nonatomic,strong)NSNumber *view_count;
@property(nonatomic,copy)NSString *comment_count;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSNumber *fav_count;
@end
