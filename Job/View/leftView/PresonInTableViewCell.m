//
//  PresonInTableViewCell.m
//  Job
//
//  Created by bidiao on 2017/7/14.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "PresonInTableViewCell.h"

@implementation PresonInTableViewCell
{

    UILabel *  _toulabel;
    
    UIImageView * _imageView;
    
    UILabel * _xiangxilabel;




}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self= [super initWithStyle:style reuseIdentifier:reuseIdentifier] ) {
        
        
        
        UILabel * toulabel = [[UILabel alloc]init];
        
       // toulabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:toulabel];
        
        
          _toulabel = toulabel;
        
        UIImageView * imageView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:imageView];
        
        _imageView = imageView;
        
       // _imageView.backgroundColor =[UIColor redColor];
        
        UILabel * label = [[UILabel alloc]init];
        
        
        [self.contentView addSubview:label];
        
        _xiangxilabel = label;
        
        label.textAlignment = NSTextAlignmentRight;
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _xiangxilabel.textColor =[UIColor grayColor];
       // label.backgroundColor =[UIColor orangeColor];
        
        //self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    
    
    return self;
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    _toulabel.frame = CGRectMake(5, 5, self.contentView.frame.size.width/4, self.contentView.frame.size.height-10);
    
    
    if (self.isImage) {
        
        _imageView.frame = CGRectMake(self.contentView.frame.size.width-40, 3, 40, self.contentView.frame.size.height-5);
        
        
    }else{
        
        _xiangxilabel.frame = CGRectMake(CGRectGetMaxX(_toulabel.frame)+10, 5, self.contentView.frame.size.width-CGRectGetMaxX(_toulabel.frame)-20, self.contentView.frame.size.height-10);
        
    }
    
    
}
-(void)setToString:(NSString *)toString{
    
    _toString = toString;
    
    _toulabel.text = toString;
}
-(void)setXingString:(NSString *)xingString{
    
    _xingString = xingString;
    
    _xiangxilabel.text = xingString;
}

-(void)setImage:(UIImage *)image{
    
    _image = image;
    
    _imageView.image = image;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
