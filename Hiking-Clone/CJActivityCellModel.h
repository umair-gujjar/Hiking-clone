//
//  CJActivityCellModel.h
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/27.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface CJActivityCellModel :JSONModel

/** 标题*/
@property(nonatomic,copy)NSString *title;
/** 行程前后多期*/
@property(nonatomic,copy)NSString *period_Desc;
/** 起始时间,如果period_desc为空时有效*/
@property(nonatomic,strong)NSNumber *start_time;
/** 标题后多期图标( >1 为多期)*/
@property(nonatomic,strong)NSNumber *period_reg_num;
/** 标题右边,0.无、1.特惠、2.赠礼*/
@property(nonatomic,strong)NSNumber *favourable_type;
/** 标签数组*/
@property(nonatomic,strong)NSArray *tag;
/** 地点前缀*/
@property(nonatomic,copy)NSString *city;
/** 地点后缀*/
@property(nonatomic,copy)NSString *destination;
/** 费用高*/
@property(nonatomic,strong)NSNumber *max_cost;
/** 费用低*/
@property(nonatomic,strong)NSNumber *min_cost;
/** logo-URL*/
@property(nonatomic,copy)NSString *logo;
/** club-标题*/
@property(nonatomic,copy)NSString *subTitle;
/** 地点图片*/
@property(nonatomic,copy)NSString *cover;
/** 行程天数*/
@property(nonatomic,strong)NSNumber *days;

/** 地点前缀*/
@property(nonatomic,strong)NSDictionary *club;


+(instancetype) activityCellModeWithDictionary:(NSDictionary *)dict;
-(instancetype) initCellModelWithDictionary:(NSDictionary *)dict;

@end
