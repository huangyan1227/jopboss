//
//  MyJobTableViewCell.m
//  Job
//
//  Created by bidiao on 2017/7/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "MyJobTableViewCell.h"

@implementation MyJobTableViewCell
{
    UILabel * _titleLabel;
    
    UILabel * _dateLabel;
    
    
    UIButton * _jinduLabel;
    
    
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel * title = [[UILabel alloc]init];
        
        _titleLabel = title;
        
        title.textColor =  [UIColor colorWithRed:61/255.0 green:0/255.0 blue:123/255.0 alpha:1];
        //title.backgroundColor =[UIColor orangeColor];
        [self.contentView addSubview:title];
        
        UILabel * date = [[UILabel alloc]init];
        
        _dateLabel = date;
        
        
        [self.contentView addSubview:date];
       // date.backgroundColor =[UIColor redColor];
        
        UIButton * jindu = [[UIButton alloc]init];
        
        self.intbutton = jindu;
        
       // jindu.textColor = [UIColor whiteColor];
        [jindu setTitleColor:[UIColor colorWithRed:115/255.0 green:57/255.0 blue:151/255.0 alpha:1] forState:UIControlStateNormal];
        
        jindu.backgroundColor =[UIColor whiteColor];
        
     
        jindu.layer.shadowColor = [ UIColor blackColor ] .CGColor;
        jindu.layer.shadowOpacity = 1.0 ;
        jindu.layer.shadowRadius = 4.0 ;
        jindu.layer.shadowOffset = CGSizeMake(0,3);
        
        jindu.layer.cornerRadius = 15;
        
        [self.contentView addSubview:jindu];
        
        ///jindu.backgroundColor = [UIColor yellowColor];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    return self;
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    _titleLabel.frame =  CGRectMake(15, 10, 180, self.frame.size.height/2-5);
    
    
    _dateLabel.frame =  CGRectMake(15,CGRectGetMaxY(_titleLabel.frame), 180, self.frame.size.height/2-5);
    
    self.intbutton.frame = CGRectMake(self.frame.size.width-100, 10, 30,30 );
    
   
    
    
    
    
}
-(void)setTitleString:(NSString *)titleString{
    
    _titleString = titleString;
    
    _titleLabel.text = titleString;
}

-(void)setDateString:(NSString *)dateString{
    
    _dateString = dateString;
    
    _dateLabel.text = dateString;
}
-(void)setProgressString:(NSString *)progressString{
    
    
    _progressString = progressString;
    
    //_jinduLabel.text = progressString;
    
    [self.intbutton setTitle:progressString forState:UIControlStateNormal];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
