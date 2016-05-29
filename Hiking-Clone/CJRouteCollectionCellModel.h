//
//  CJRouteCollectionCellModel.h
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/29.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "JSONModel.h"

@protocol  CJRouteCollectionCellModel



@end

@interface CJRouteCollectionCellModel : JSONModel

@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *trail_count;
@end
