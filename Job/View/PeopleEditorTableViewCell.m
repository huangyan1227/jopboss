//
//  PeopleEditorTableViewCell.m
//  Job
//
//  Created by bidiao on 2017/7/18.
//  Copyright © 2017年 bidiao. All rights reserved.
//

#import "PeopleEditorTableViewCell.h"

@implementation PeopleEditorTableViewCell
{
    UILabel * _labeleTitle;
    UITextField * _textFile;
}

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        
//        UILabel * label = [[UILabel alloc]init];
//        
//        _labeleTitle = label;
//        
//        ///label.backgroundColor = [UIColor yellowColor];
//        
//      //  [self.contentView addSubview:label];
//        
//      
//            UITextField * textfield =[[UITextField alloc]init];
//            
//            _textFile = textfield;
//            
//            textfield.backgroundColor = [UIColor redColor];
//         //   [textfield addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
//         //  [self.contentView addSubview:textfield];
//      
//        
//       // self.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//        
//      //  self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//
//        
//    }
//    
//    return self;
//}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self= [super initWithStyle:style reuseIdentifier:reuseIdentifier] ) {
        
        
        
                    UITextField * textfield =[[UITextField alloc]init];
        
                    _textFile = textfield;
        
                    textfield.backgroundColor = [UIColor redColor];
                    [textfield addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                   [self.contentView addSubview:textfield];
        
        UILabel * toulabel = [[UILabel alloc]init];
        
        // toulabel.backgroundColor = [UIColor yellowColor];
    //    [self.contentView addSubview:toulabel];
        
        
      //  _toulabel = toulabel;
        
        UIImageView * imageView = [[UIImageView alloc]init];
        
      //  [self.contentView addSubview:imageView];
        
      ///  _imageView = imageView;
        
        // _imageView.backgroundColor =[UIColor redColor];
        
        UILabel * label = [[UILabel alloc]init];
        
        
     //   [self.contentView addSubview:label];
        
       // _xiangxilabel = label;
        
     //   label.textAlignment = NSTextAlignmentRight;
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //    _xiangxilabel.textColor =[UIColor grayColor];
        // label.backgroundColor =[UIColor orangeColor];
        
        //self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    
    
    return self;
    
}

-(void)textFieldDidChange :(UITextField *)theTextField{
    
    NSLog( @"text changed: %@", theTextField.text);
    
}
-(void)layoutSubviews{
    
  _labeleTitle.frame = CGRectMake(5, 0, 130, self.contentView.frame.size.height);
      if (self.istext) {
    _textFile.frame = CGRectMake(120, 0, self.frame.size.width-120, self.contentView.frame.size.height);
          
          _textFile.tag = self.tagInteger;
      }
}
-(void)setLabeTitleString:(NSString *)labeTitleString{
    
     _labeTitleString = labeTitleString;
    
    
    _labeleTitle.text = labeTitleString;
    
    
    
    
}


@end
