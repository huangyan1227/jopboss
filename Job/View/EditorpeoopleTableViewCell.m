//
//  EditorpeoopleTableViewCell.m
//  Job
//
//  Created by bidiao on 2017/7/19.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "EditorpeoopleTableViewCell.h"

@implementation EditorpeoopleTableViewCell
{
    
    
        UILabel * _labeleTitle;
        UILabel * _datelabel;
       // UITextField * _textFile;
    
}
#define fontColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self= [super initWithStyle:style reuseIdentifier:reuseIdentifier] ) {
        
        
        
                UILabel * label = [[UILabel alloc]init];
        
                _labeleTitle = label;
        
        
                [self.contentView addSubview:label];
        
        
                UITextField * textfield =[[UITextField alloc]init];
        
                    _textFile = textfield;
        
        [self.contentView addSubview:textfield];
        
        UITextView * textView = [[UITextView alloc]init];
        
        textView.layer.borderColor =[ UIColor grayColor].CGColor;
        
        textView.layer.borderWidth=2;
        
        _textView = textView;
        
        [self.contentView addSubview:textView];
        
        UIButton * button = [[UIButton alloc]init];
        
        _button = button;
        
        [self.contentView addSubview:button];
        
        //button.tag= 100+indexPath.row;
        
       // label.frame = CGRectMake(120, 0, self.view.frame.size.width-130, cell.frame.size.height);
        
        //[label addTarget:self action:@selector(clickBu:) forControlEvents:UIControlEventTouchUpInside];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         button.titleLabel.font =[UIFont systemFontOfSize:14];
    
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    
    
    return self;
    
}
-(void)textFieldDidChange :(UITextField *)theTextField{
    
   // NSLog( @"text changed: %@", theTextField.text);
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    if (_isDetails) {
           _labeleTitle.frame = CGRectMake(5, 0, 100, 44);
        
        _textView.frame = CGRectMake(20, 55, self.frame.size.width-40, self.frame.size.height-65);
    }else{
        
        _labeleTitle.frame = CGRectMake(5, 0, 100, self.contentView.frame.size.height);
         _textView.frame = CGRectMake(0, 0, 0, 0);

    }
    
    
      if (self.istext) {
          
      _textFile.frame = CGRectMake(120, 0, self.frame.size.width-120,self.contentView.frame.size.height);

          _textView.frame = CGRectMake(0, 0, 0, 0);
          
          _textFile.tag = self.tagInteger;
        
      }
    if (self.isbutton) {
        _textView.frame = CGRectMake(0, 0, 0, 0);
        

       _button.frame =  CGRectMake(120, 0, self.frame.size.width-130, self.frame.size.height);
        _button.tag= self.tagInteger;
    }
}
-(void)setLabeTitleString:(NSString *)labeTitleString{
    
    _labeTitleString = labeTitleString;
    
    
    _labeleTitle.text = labeTitleString;
    
     _labeleTitle.textColor = fontColor(117, 66, 152);
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
