//
//  PickerViewCell.m
//  PickerCell
//
//  Created by Sea on 17/3/7.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import "PickerViewCell.h"

@implementation PickerViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lb_title = [[UILabel alloc]init];
        [_lb_title setFrame:CGRectMake(20, 0, 260, 40)];
        _lb_title.textColor = [UIColor blackColor];
        [_lb_title setFont:[UIFont systemFontOfSize:17]];
        [self.contentView addSubview:_lb_title];
        
    }
    return  self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
