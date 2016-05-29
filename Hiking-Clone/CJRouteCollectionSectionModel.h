//
//  CJRouteCollectionSection.h
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/29.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "JSONModel.h"
#import "CJRouteCollectionCellModel.h"

@interface CJRouteCollectionSectionModel : JSONModel

@property(nonatomic,strong)NSMutableArray<CJRouteCollectionCellModel> *province;
@property(nonatomic,copy)NSString *region;

@end
