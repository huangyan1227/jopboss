//
//  MyJobPeopleTableViewCell.m
//  Job
//
//  Created by bidiao on 2017/12/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "MyJobPeopleTableViewCell.h"

@implementation MyJobPeopleTableViewCell
{
    UILabel * _namelabel;
    
    UILabel * _dateLabel;
    
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        
        UILabel * namelabel = [UILabel new];
        
        //namelabel.backgroundColor = [UIColor redColor];
        
        _namelabel =namelabel;
        
        [self.contentView addSubview:namelabel];
        
        
        UILabel * datelabel = [UILabel new];
        
        _dateLabel = datelabel;
        
        [self.contentView addSubview:datelabel];
        
        
        
        
        
        
        
        
        
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
     //   self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        
        
        
    }
    
    
    
    
    
    return self;
    
    
}
-(void)layoutSubviews{
    
    
    [super layoutSubviews];
    
    
    _namelabel.frame = CGRectMake(15, 5, self.contentView.frame.size.width-30, self.frame.size.height/2);
    
    _dateLabel.frame = CGRectMake(15, CGRectGetMaxY(_namelabel.frame), self.contentView.frame.size.width-30, self.frame.size.height/2-5);
    
    
    
}
-(void)setNameTitle:(NSString *)nameTitle{
    
    
    _nameTitle = nameTitle;
    
    _namelabel.text = nameTitle;
}
-(void)setDateTitle:(NSString *)dateTitle{
    
    _dateTitle = dateTitle;
    
    _dateLabel.text = dateTitle;
    _dateLabel.textColor = [UIColor lightGrayColor];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
