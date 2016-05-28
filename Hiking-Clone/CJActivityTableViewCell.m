//
//  CJActivityTableViewCell.m
//  Hiking-Clone
//
//  Created by qianfeng on 16/5/27.
//  Copyright © 2016年 CJ.W. All rights reserved.
//

#import "CJActivityTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface CJActivityTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *mainView;

/** 行程前后多期*/
@property(nonatomic,weak)IBOutlet UILabel *period_descL;
/** 起始时间,如果period_desc为空时有效*/
@property(nonatomic,weak)IBOutlet UILabel *start_timeL;

/** 标题右边,0.无、1.特惠、2.赠礼*/
@property(nonatomic,weak)IBOutlet UIImageView *favourable_typeImgView;
/** 标签数组*/
@property(nonatomic,weak)IBOutlet UIView *tagV;
/** 地点前缀*/
@property(nonatomic,weak)IBOutlet UILabel *cityL;
/** 地点后缀*/
@property(nonatomic,weak)IBOutlet UILabel *destinationL;
/** 费用*/
@property(nonatomic,weak)IBOutlet UILabel *cost;
/** logo-URL*/
@property(nonatomic,weak)IBOutlet UIImageView *logoV;
/** club-标题*/
@property(nonatomic,weak)IBOutlet UILabel *logoTitle;
/** 地点图片*/
@property(nonatomic,weak)IBOutlet UIImageView *coverImgView;
/** 行程天数*/
@property(nonatomic,weak)IBOutlet UILabel *daysL;

@end

@implementation CJActivityTableViewCell

-(void)setModel:(CJActivityCellModel *)model
{
    _model = model;
    self.titleL.text = model.title;
    
    
    self.favourable_typeImgView.hidden = YES;
    // 创建一个富文本
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:model.title];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    if (![model.period_Desc isEqualToString:@"0"]) {
        // 图片
        attch.image = [UIImage imageNamed:@"duoqi"];
        // 设置图片大小
        attch.bounds = CGRectMake(0, 0, 28, 22);
    }else
    {
        attch.image = [UIImage imageNamed:@""];
        attch.bounds = CGRectMake(0, 0, 0, 0);
    }
    
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    [attri appendAttributedString:string];
    
    // 用label的attributedText属性来使用富文本
    CGSize titleSize = [attri boundingRectWithSize:CGSizeMake(265, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    CGPoint p = self.titleL.frame.origin;
    self.titleL.frame = CGRectMake(p.x, p.y, titleSize.width+40, titleSize.height+20);
    self.titleL.attributedText = attri;
    self.favourable_typeImgView.hidden = YES;
    
//    switch ([model.favourable_type intValue]) {
//        case 0:
//        {
////            self.titleL.frame = CGRectMake(10, 10, 265, 21);
//            
//        }
//            break;
//        case 1:
//        {
//            self.titleL.frame = CGRectMake(10, 10, 235, 21);
//            self.favourable_typeImgView.hidden = NO;
//            self.favourable_typeImgView.image = [UIImage imageNamed:@"tehui"];
//        }
//            break;
//        case 2:
//        {
//            self.titleL.frame = CGRectMake(10, 10, 235, 21);
//            self.favourable_typeImgView.hidden = NO;
//            self.favourable_typeImgView.image = [UIImage imageNamed:@"remen"];
//        }
//            break;
//        default:
//            break;
//    }

    CGFloat count = 0;
    CGFloat labelSpacing = 5;
    for (UIView *view in self.tagV.subviews) {
        [view removeFromSuperview];
    }
    for (int i =0 ; i<model.tag.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        NSString *str = model.tag[i];
        if (str.length == 3) {
            label.frame = CGRectMake(labelSpacing*i +count, 0, 44, 21);
            count +=44;
        }else
        {
            label.frame = CGRectMake(labelSpacing*i +count, 0, 34, 21);
            count +=44;
        }
        label.text = str;
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.backgroundColor = [UIColor cyanColor];
        [self.tagV addSubview:label];
    }
    self.destinationL.text = [NSString stringWithFormat:@"%@ - %@",model.city,model.destination];
    self.start_timeL.text = [NSString stringWithFormat:@"%@ 行程%@天",[self bySecondGetDate:model.start_time.stringValue],model.days];
    if (model.min_cost == model.max_cost) {
        self.cost.text = [NSString stringWithFormat:@"¥%@",model.min_cost];
    }else
    {
        self.cost.text = [NSString stringWithFormat:@"¥%@ - ¥%@",model.min_cost,model.max_cost];
    }
    [self.logoV sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:[UIImage imageNamed:@"photo"]];
    self.logoTitle.text = model.subTitle;
    [self.coverImgView sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:@"photo"]];
    
    
    
}

//根据秒数获得时间
-(NSString *)bySecondGetDate:(NSString *)second
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateLoca = [NSString stringWithFormat:@"%@",second];
    NSTimeInterval time=[dateLoca doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSString *timestr = [formatter stringFromDate:detaildate];
    return timestr;
}

- (void)awakeFromNib {
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
