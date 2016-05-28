//
//  CJActivityCellModel.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/27.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "CJActivityCellModel.h"

@implementation CJActivityCellModel

//+(JSONKeyMapper *)keyMapper
//{
//    return [[JSONKeyMapper alloc] initWithDictionary:@{@"club.title":@"subTitle",@"club.logo":@"logo"}];
//}
+(instancetype) activityCellModeWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initCellModelWithDictionary:dict];
}
-(instancetype) initCellModelWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        self.logo = self.club[@"logo"];
        self.subTitle = self.club[@"title"];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"period_desc"]) {
        if (value == nil) {
            [self setValue:@"0" forKey:@"period_Desc"];
        }else
        {
            [self setValue:value forKey:@"period_Desc"];
        }
    }
}
@end
