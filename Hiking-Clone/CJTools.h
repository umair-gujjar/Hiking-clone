//
//  CJTools.h
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/29.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJRefresh.h"

@interface CJTools : NSObject

+(id)toolTogetData:(NSString *)identifier;
+(void)toolToSaveWithData:(id)data withIdentifier:(NSString *)identifier;
@end
