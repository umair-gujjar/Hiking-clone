//
//  CJTravelModel.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/28.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "CJTravelModel.h"

@implementation CJTravelModel

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"created_by.avatar":@"avatar",@"created_by.nickname":@"nickname"}];
}

@end
