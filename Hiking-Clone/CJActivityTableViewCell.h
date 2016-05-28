//
//  CJActivityTableViewCell.h
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/27.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJActivityCellModel.h"

@interface CJActivityTableViewCell : UITableViewCell

@property(nonatomic,strong)CJActivityCellModel *model;

/** 标题*/
@property(nonatomic,strong)IBOutlet UILabel *titleL;
/** 标题后多期图标( >1 为多期)*/
@property(nonatomic,strong)IBOutlet UILabel *period_reg_numL;
@end
