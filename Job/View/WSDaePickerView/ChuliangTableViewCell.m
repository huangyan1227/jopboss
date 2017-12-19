//
//  ChuliangTableViewCell.m
//  Job
//
//  Created by bidiao on 2017/7/20.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "ChuliangTableViewCell.h"

@implementation ChuliangTableViewCell
{
    UIButton * _button;
    UILabel  * _lable;
    UIImageView * _chatImage;
    
}
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIButton * button =[[UIButton alloc]init];
        
        _button = button;
        
        UIImageView * iamgeView = [[UIImageView alloc]init];
        
        _chatImage = iamgeView;
        
        [self.contentView addSubview:iamgeView];
        
        UILabel * lable =[[UILabel alloc]init];
        
        _lable = lable;
        
        [self.contentView addSubview:lable];
        
        //[button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
        //[button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        
        
    }
    
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    _chatImage.frame = CGRectMake(10, 10, 30, 30);
    
    _lable.frame =CGRectMake(60, 5, self.frame.size.width-60, 40);
    
    
}

-(void)setLableString:(NSString *)lableString{
    
    _lableString = lableString;
    
    
    _lable.text = lableString;
    
   
    
    if (self.isShow) {
        
        
        
    }else{
        
        
        _chatImage.image  =[UIImage imageNamed:@"duia"];
        
        
        
    }
    
    
    
    
    
    
}
-(void)setJopShow:(JopMode *)jopShow{
    
    _jopShow = jopShow;
    
    if (jopShow.isSelect) {
        _chatImage.image  =[UIImage imageNamed:@"duib"];
    }else{
        
        _chatImage.image  =[UIImage imageNamed:@"addre"];
        
    }
    
     _lable.text = jopShow.titleMeth;
     _lable.textColor = fontColor(112, 50, 148);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
