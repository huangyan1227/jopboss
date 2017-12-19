//
//  SZCalendarCell.m
//  SZCalendarPicker
//
//  Created by Stephen Zhuang on 14/12/1.
//  Copyright (c) 2014年 Stephen Zhuang. All rights reserved.
//

#import "SZCalendarCell.h"

@implementation SZCalendarCell
{
    UIImage * _imageg;
}
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:self.bounds];
      
        
        [_dateLabel setTextAlignment:NSTextAlignmentCenter];
        [_dateLabel setFont:[UIFont systemFontOfSize:17]];
        [self addSubview:_dateLabel];
    }
    return _dateLabel;
}
-(UIImageView*)imagView{
    
    if (!_imagView) {
        //NSLog(@"ff");
  _imagView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 40, 30)];
        
       // image.image = _imageg;
        
        [self insertSubview:_imagView atIndex:0];
        
    }
    

    
    
    return _imagView;
    
    
}
@end
