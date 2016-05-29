//
//  CJTools.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/29.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "CJTools.h"

@implementation CJTools

+(NSMutableArray *)toolTogetData:(NSString *)identifier
{
    NSString *path = [NSString stringWithFormat:@"%@/Caches/%@.plist",NSHomeDirectory(),identifier];
    NSMutableArray *arr = [NSMutableArray arrayWithContentsOfFile:path];
    return arr;
}
+(void)toolToSaveWithData:(id)data withIdentifier:(NSString *)identifier
{
    NSString *path = [NSString stringWithFormat:@"%@/Caches/%@.plist",NSHomeDirectory(),identifier];
    [data writeToFile:path atomically:YES];
}


@end
